#!/usr/bin/env python3

# This script is targeted towards Linux systems and as such it is not guaranteed to work on computers running Windows.

import subprocess
import yaml
import argparse
import fileinput


MOBILE_APPLICATION_SUBDIRECTORY = "SlemaForAndroid"


def main():
    args = get_args()
    mobile_application_path = args.path + "/" + MOBILE_APPLICATION_SUBDIRECTORY

    if not args.ignore_dirty_tree:
        validate_vcs_tree(args.path)

    version = get_project_version(mobile_application_path)

    if args.build:
        build_flutter_project(mobile_application_path)

    print_task_list(args.path, args.commitish1, args.commitish2)

    if args.add_tag:
        add_git_tag(args.path, version)

    increment_flutter_project_version(mobile_application_path, version)

    if args.commit_version:
        commit_incremented_version(args.path)


def validate_vcs_tree(project_path):
    # The VCS tree should be empty, since this script modifies its state
    process_not_staged = subprocess.run(["git", "diff"], cwd=project_path, capture_output=True)
    process_staged = subprocess.run(["git", "diff", "--staged"], cwd=project_path, capture_output=True)
    if len(process_not_staged.stdout) > 0 or len(process_staged.stdout) > 0:
        raise RuntimeError("The script cannot work with a dirty tree")


def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("-p", "--path", help="Path to the project.", default="../..")
    parser.add_argument("-i", "--ignore-dirty-tree", help="Ignore dirty VCS tree.", action="store_true",
                        dest="ignore_dirty_tree")
    parser.add_argument("-t", "--add-tag", help="Adds a new tag based on the current version.",
                        action="store_true", dest="add_tag")
    parser.add_argument("-c", "--commit-version", help="Commits version change in pubspec.yaml.",
                        action="store_true", dest="commit_version")
    parser.add_argument("-n", "--no-build", help="Makes the script not build the project",
                        action="store_false", dest="build")
    parser.add_argument("-c1", "--commitish1", help="Starting commitish used to fetch completed tasks.",
                        default="", dest="commitish1")
    parser.add_argument("-c2", "--commitish2", help="Ending commitish used to fetch completed tasks.",
                        default="HEAD", dest="commitish2")
    return parser.parse_args()


def get_project_version(project_path):
    with open(project_path + "/pubspec.yaml", "r") as stream:
        data = yaml.safe_load(stream)

    full_version = data["version"]
    stripped = full_version.split("+", 1)[0]
    split_stripped = stripped.split(".", 3)

    # Assumption: The version string always consists of major, minor and patch values. If this is not the case,
    # it should be corrected manually.
    major = int(split_stripped[0])
    minor = int(split_stripped[1])
    patch = int(split_stripped[2])

    return {
        "full_version": full_version,
        "major": major,
        "minor": minor,
        "patch": patch,
    }


def build_flutter_project(project_path):
    subprocess.run(["flutter", "build", "apk", "--split-per-abi", "lib/main.dart"], cwd=project_path, check=True)


def increment_flutter_project_version(project_path, version):
    version["minor"] = version["minor"] + 1
    version["patch"] = 0

    new_version_string = str(version["major"]) + "." + str(version["minor"]) + "." + str(version["patch"])

    success = False
    with fileinput.FileInput(project_path + "/pubspec.yaml", inplace=True) as file:
        for line in file:
            if not success and "version" in line:
                new_line = line.replace(version["full_version"], new_version_string)
                print(new_line, end="")
                success = new_version_string in new_line
            else:
                print(line, end="")

    if success:
        print("Incremented project version successfully", version["full_version"], "->", new_version_string)
    else:
        raise RuntimeError("Could not increment project version")


def print_task_list(project_path, commitish1, commitish2):
    if not commitish1:
        last_tag_output = subprocess.run(
            ["git", "describe", "--tags", "--abbrev=0"], cwd=project_path, check=True, capture_output=True
        )

        commitish1 = last_tag_output.stdout.decode("utf-8").split("\n")[0]

    commits_output = subprocess.run(
        ["git", "log", commitish1 + ".." + commitish2, "--pretty=format:%s", "--no-merges"], cwd=project_path,
        check=True, capture_output=True,
    )

    commits_list_string = commits_output.stdout.decode("utf-8")
    task_list = []
    for commit_message in commits_list_string.split("\n"):
        first_word = commit_message.split(" ", 1)[0]
        if "SLEMA-" not in first_word:
            continue

        if first_word in task_list:
            continue

        task_list.append(first_word)
    task_list.sort()

    print("PRINTING TASK LIST:")
    for task in task_list:
        print(task)
    print("FINISHED PRINTING TASK LIST")


def add_git_tag(project_path, version):
    subprocess.run(
        ["git", "tag", "-a", version["full_version"], "-m", "Version " + version["full_version"] + " finished"],
        cwd=project_path, check=True
    )


def commit_incremented_version(project_path):
    subprocess.run(["git", "commit", "-am", "Incremented version"], cwd=project_path, check=True)


if __name__ == '__main__':
    main()
