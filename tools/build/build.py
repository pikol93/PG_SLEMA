#!/usr/bin/env python3

# This script is targeted towards Linux systems and as such it is not guaranteed to work on computers running Windows.

import subprocess
import yaml
import argparse
import fileinput


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-p", "--path", help="Path to the project.", default="../..")
    args = parser.parse_args()
    print(args)

    version = get_project_version(args.path)
    print("got version", version)
    subprocess.run(["flutter", "build", "apk", "--split-per-abi", "lib/main/main.dart"], cwd=args.path, check=True)

    increment_project_version(args.path, version)


def get_project_version(project_path):
    print("Getting the version tuple")
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


def increment_project_version(project_path, version):
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


if __name__ == '__main__':
    main()
