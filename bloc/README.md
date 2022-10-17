# Начало

В данном шаблоне используется Flutter 2 с включенным Null Safety.

В качестве нативной части выбран Kotlin для Android и Swift для iOS.

1. Клонируете репозиторий
1. Удаляете папку .git
1. Инициализируете git и привязываете репозиторий проекта

```bash
rm -rf .git
git init
git remote add origin git@github.com:username/new_repo

flutter pub get
flutter pub run build_runner build
```

## Содержание

1. [Архитектура](doc/arch.md)
1. [Окружение](doc/environment.md)
1. [Запуск](doc/run.md)
1. [Ответы на вопросы (FAQ)](doc/faq.md)
    1. [Изменение Package Name](doc/faq.md#1-изменение-package-name)
    1. [Изменение name в pubspec.yaml](doc/faq.md#2-изменение-name-в-pubspecyaml)
    1. [Локализация](doc/faq.md#3-локализация)
    1. [Пример использования NoAnimationRoute](doc/faq.md#4-пример-использования-noanimationroute)
    1. [Замена стандартной иконки](doc/faq.md#5-замена-стандартной-иконки)
    1. [Добавление поддержки Flutter Web](doc/faq.md#6-добавление-поддержки-flutter-web)
1. [CI](doc/ci.md)
    1. [Dev](doc/ci.md#dev-action)
    1. [Stage](doc/ci.md#stage-action)
    1. [Production](doc/ci.md#production-action)
   
## Ссылки с полезными вещами для дополнения документации:
1. [Документация для построения графиков и прочего](https://mermaid-js.github.io/mermaid/#/flowchart)
1. [Онлайн редактор Markdown Dillinger](https://dillinger.io)
1. [Онлайн редактор Markdown StackEdit](https://stackedit.io/app#)
