# Antlibs Common

This is a skeleton to make development of Ant Libraries provided by
the Apache Ant Project follow the same pattern.

The repository is only mean to be included as git submodule into the
actual Antlib. It provides common infrastructure using Apache Ant to
build and Apache Ivy for dependency management.

## Setting up a new Antlib Project

* Create a new git repository via https://gitbox.apache.org/boxer/
* Clone it locally
* add this git repository as submodule named common to your new
  repository: `git submodule add
  https://gitbox.apache.org/repos/asf/ant-antlibs-common.git common`
* run `ant -f common/seed-new-antlib.xml`
* this has copied files from common to your root directory: `LICENSE`,
  `gitignore`, `.gitattributes`, `docs/style.css`
* it created files `NOTICE`, `build.xml`, `changes.xml`,
  `contributors.xml`, `version.properties` and `ivy.xml` based on your
  inputs. You should review its contents.
* if there are any properties you want to override (you most likely
  will want to change `javac.-source` and `javac.-target`) create a
  `build.properties` file and add them.
* sources are expected to go to `src/main`, test sources to
  `src/tests` (JUnit tests to `src/tests/junit`, AntUnit tests to
  `src/tests/antunit`).
* if you want to set up a Jenkins build you can copy and adapt the
  `prepare.xml` file from `common` to the root directory of your
  antlib.
* once you want to publish your antlib, you'll likely need a
  `project-template.pom` like
  https://github.com/apache/ant-antlibs-compress/blob/master/project-template.pom
