# Współpraca

Ten plik odpowiedzialny jest za uporządkowanie informacji powiązanych z przeprowadzaniem procesu wprowadzania nowych zmian do projektu aplikacji mobilnej.

## Tworzenie zmian

Tworzenie zmian wymaga od programisty, aby gałąź w której naniesie zmiany nazwana była w taki sposób, aby zaczynała się od nazwy produktu (SLEMA), ogranicznika w postaci myślnika i numeru zadania powiązanego z daną gałęzią. Numer zadania pobierany jest z platformy Jira. W przypadku, kiedy gałąź nie jest powiązana z żadnym zadaniem, należy takie zadanie stworzyć. Służy to dokumentacji wszystkich istniejących i rozwiązanych problemów z produktem. Przykładowymi nazwami gałęzi są:
```
SLEMA-21
```
lub
```
SLEMA-129
```

Wszystkie składowe gałęzi (commity) powinny w swoich wiadomościach również zawierać nazwę produktu oraz numer zadania podobnie jak w przypadku nazw gałęzi. Takie podejście pozwala na namierzenie zadania, które spowodowało konkretne zmiany. Przykładowymi nazwami commitów są:
```
SLEMA-57 Added README.md
```
lub
```
SLEMA-2181 Fixed NPE caused by invalid ctor call
```

Po utworzeniu gałęzi, ale przed dodaniem jakichkolwiek zmian, zadaniem programisty jest upewnienie się, że kod jest poprawnie zformatowany. W przypadku, kiedy kod nie będzie poprawnie zformatowany, należy utworzyć PR ze zmianami zaproponowanymi przez system formatujący kod. Pomoże to ograniczyć zmiany we fragmentach repozytorium, które nie są powiązane z danym zadaniem.

## Proces PR (Pull Request)

Po utworzeniu kodu realizującego zadanie (w części lub w całości), zadaniem osoby odpowiedzialnej za dane zadanie jest utworzenie PR zawierającego wszystkie zmiany. Kod oddany do przeglądu musi być poprawnie zformatowany, a analiza statyczna nie może wykazywać żadnych błędów. Przeglądający zoobowiązani są do przeprowadzenia analizy statycznej, a w przypadku gdzie okaże się, że istnieją błędy należy dodać je jako komentarz do PR wraz z prośbą o ich naprawę przed dołączeniem zmian do głównej gałęzi.

PR można dołączyć do gałęzi głównej dopiero po akceptacji przez co najmniej jednego programisty. Jeżeli kod jest mocno skomplikowany lub obejmuje duże części repozytorium wskazane jest, aby w procesie przeglądania uczestniczyła więcej niż jedna osoba jednak nie jest to obowiązkowe.

Po otrzymaniu potwierdzenia od przeglądających, osoba odpowiedzialna za gałąź musi upewnić się, że aplikacja po dołączeniu do głównej gałęzi będzie działać prawidłowo. W tym celu należy zmergować główną gałąź do tej, na której obecnie pracuje i przetestować wypracowane przez siebie rozwiązanie.

## Formatowanie kodu

Do formatowania kodu wykorzystywany jest formatter wbudowany w narzędzie `dart`. Polecenie należy wywołać w następujący sposób:

```bash
dart format .
```

Jeżeli commit nie zawiera żadnych zmian poza formatowaniem, należy nazwać go korzystając z nazwy produktu, ogranicznika, numeru zadania oraz podpisu "Dart format". Na przykład:
```
SLEMA-12 Dart format
```
lub 
```
SLEMA-666 Dart format
```

## Analiza statyczna

Do analizy statycznej wykorzystywane jest narzędzie flutter. Wykorzystywane jest w następujący sposób:
```bash
flutter analyze
```
W przypadku, gdzie gałąź wprowadza błędy wykryte przez ten proces, nie może ona zostać połączona z gałęzią główną bez rozwiązania problemu lub potwierdzenia przez innych programistów w zespole. Zmianę konwencji należy przedyskutować w gronie całej drużyny.
