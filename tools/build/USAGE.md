# Narzędzie do budowania projektu

## Opis
Narzędzie wykorzystywane jest w celu przebudowania aplikacji oraz przypisanie następnej wersji. Poza tymi procesami, skrypt działa na systemie kontroli wersji w celu dodania nowego tagu oraz commita zawierającego zmianę wersji.

## Uruchamianie
Przed uruchomieniem skryptu należy upewnić się, że nie ma żadnych zmian w drzewie systemu kontroli wersji.
Można tego dokonać poprzez wywołanie `git diff`.
W przypadku, kiedy istnieją jakieś różnice w drzewie, należy je zcommitować lub usunąć tak, aby drzewo było w czystym stanie.
W celu uruchomienia narzędzia, należy znaleźć się w podkatalogu projektu `/tools/build`, a następnie uruchomić polecenie poprzez `./build.py`.
Alternatywnie, można uruchomić narzędzie podając mu ścieżkę do katalogu zawierającego korzeń projektu.
Na przykład, znajdując się w korzeniu projektu można wywołać `./tools/build/build.py --path .`.
Wszystkie dostępne opcje wylistować można za pomocą polecenia `./build.py -h`. 
Domyślnie, narzędzie nie wywołuje żadnych zmian w drzewie VCS.
Pełne wykonanie operacji przez narzędzie odbywa się po wpisaniu `./build.py --add-tag --commit-version`.

## Uwagi
Narzędzie zostało stworzone z myślą o systemach z rodziny Linux.
System Windows nie jest na ten moment wspierany, a działanie narzędzia może przynieść niepożądane skutki.