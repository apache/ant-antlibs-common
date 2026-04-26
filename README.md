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
* copy `LICENSE`, `gitignore` and `.gitattributes` from `common` to
  the top level directory of your new antlib.
* copy `NOTICE.template` from `common` to a file named `NOTICE` inside
  the top level directory of your new antlib and adapt its content
  (PRODUCT_NAME and copyright year.
* add a minimal `build.xml` file to the top level directory of your
  project.
  Something like
```xml
<?xml version="1.0"?>
<!--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
<project default="compile" name="YOUR_ANTLIB_NAME">

  <!-- easy way to override properties -->
  <property file="build.properties"/>

  <import file="common/build.xml"/>
</project>
```
* if there are any properties you want to override (you most likely
  will want to change `javac.-source` and `javac.-target`) create a
  `build.properties` file and add them.
* create a more or less empty `contributors.xml` file to the top level
  directory of your antlib. Add yourself. The structure is
```xml
<?xml version="1.0" encoding="utf-8"?>
<!--
   Licensed to the Apache Software Foundation (ASF) under one or more
   contributor license agreements.  See the NOTICE file distributed with
   this work for additional information regarding copyright ownership.
   The ASF licenses this file to You under the Apache License, Version 2.0
   (the "License"); you may not use this file except in compliance with
   the License.  You may obtain a copy of the License at

       https://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
-->
<!DOCTYPE contributors
[
<!ELEMENT name (first?, middle?, last)>
<!ELEMENT contributors (introduction, name+)>
<!ELEMENT first (#PCDATA)>
<!ELEMENT introduction (#PCDATA)>
<!ELEMENT middle (#PCDATA)>
<!ELEMENT last (#PCDATA)>
]
>

<contributors>
  <introduction>
  These are some of the many people who have helped with this Ant Library.
  </introduction>
  <name>
    <first>YOUR FIRST NAME</first>
    <last>YOUR LAST NAME</last>
  </name>
</contributors>
```
* create a more or less empty `changes.xml` file to the top level
  directory of your antlib. The structure is
```xml
<?xml version="1.0" encoding="utf-8"?>
<!--
   Licensed to the Apache Software Foundation (ASF) under one or more
   contributor license agreements.  See the NOTICE file distributed with
   this work for additional information regarding copyright ownership.
   The ASF licenses this file to You under the Apache License, Version 2.0
   (the "License"); you may not use this file except in compliance with
   the License.  You may obtain a copy of the License at

       https://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
-->
<!DOCTYPE document
[
<!ELEMENT document (properties?, release+)>
<!ELEMENT properties (title)>
<!ELEMENT title (#PCDATA)>
<!ELEMENT release (action*)>
<!ELEMENT action (#PCDATA)>
<!ATTLIST release
          version CDATA #REQUIRED
          date CDATA #REQUIRED
          description CDATA #IMPLIED>
<!ATTLIST action
          issue CDATA #IMPLIED
          type (add|fix|remove|update) #REQUIRED
          breaks-bwc (true|false) #IMPLIED>
]
>
<document>
  <properties>
    <title>YOUR LIBRARY NAME</title>
  </properties>

  <release version="0.1" date="unreleased">
  </release>
</document>
```
* add `version.properties` to the top level directory of your antlib
  which must at least contain a definition of
  `artifact.version`. Something like
```
#  Licensed to the Apache Software Foundation (ASF) under one or more
#  contributor license agreements.  See the NOTICE file distributed with
#  this work for additional information regarding copyright ownership.
#  The ASF licenses this file to You under the Apache License, Version 2.0
#  (the "License"); you may not use this file except in compliance with
#  the License.  You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
artifact.version=0.1alpha
```
* if you want to use Ivy to manage your dependencies, add a file
  `ivy.xml` to the root directory of your antlib and set it up.
  A starting point may be
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!--

   Licensed to the Apache Software Foundation (ASF) under one or more
   contributor license agreements.  See the NOTICE file distributed with
   this work for additional information regarding copyright ownership.
   The ASF licenses this file to You under the Apache License, Version 2.0
   (the "License"); you may not use this file except in compliance with
   the License.  You may obtain a copy of the License at

       https://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

-->
<ivy-module version="2.0">
  <info organisation="org.apache.ant"
        module="${artifact.name}"
        revision="${artifact.version}"
        publication="${artifact.publication.datetime}">
    <license name="Apache Software License 2.0"
             url="https://www.apache.org/licenses/LICENSE-2.0"/>
    <ivyauthor name="Apache Ant Development Team"
               url="https://ant.apache.org/"/>
    <description homepage="YOUR-ANTLIB_HOMEPAGE">
      YOUR_DESCRIPTION
    </description>
  </info>
  <configurations>
		<conf name="default" description="full antlib with all dependencies"/>
        <conf name="provided" description="Ant must be present at runtime"/>
		<conf name="test" description="dependencies used for tests of the antlib" transitive="false" visibility="private"/>
  </configurations>
  <publications xmlns:e="urn:ant.apache.org:ivy-extras">
    <artifact name="${artifact.name}" type="pom" ext="pom"/>
    <artifact name="${artifact.name}" type="pom.asc" ext="pom.asc"/>
    <artifact name="${artifact.name}" type="jar" ext="jar"/>
    <artifact name="${artifact.name}" type="jar.asc" ext="jar.asc"/>
    <artifact name="${artifact.name}" type="source" ext="jar"
              e:classifier="sources"/>
    <artifact name="${artifact.name}" type="source.asc" ext="jar.asc"
              e:classifier="sources"/>
    <artifact name="${artifact.name}" type="javadoc" ext="jar"
              e:classifier="javadoc"/>
    <artifact name="${artifact.name}" type="javadoc.asc" ext="jar.asc"
              e:classifier="javadoc"/>
    <artifact name="${artifact.name}" type="ivy" ext="xml"
              e:classifier="ivy"/>
    <artifact name="${artifact.name}" type="ivy.asc" ext="xml.asc"
              e:classifier="ivy"/>
  </publications>
  <dependencies>
    <dependency org="org.apache.ant" name="ant" rev="1.10.17" conf="provided->default"/>
  </dependencies>
</ivy-module>
```
* documentation should go to a `docs` directory, copy `style.css` from
  `common` to your `docs` directory if you want to use the commons
  styles.
* sources are expected to go to `src/main`, test sources to
  `src/tests` (JUnit tests to `src/tests/junit`, AntUnit tests to
  `src/tests/antunit`).
* if you want to set up a Jenkins build you can copy and adapt the
  `prepare.xml` file from `common` to the root directory of your
  antlib.
* once you want to publish your antlib, you'll likely need a
  `project-template.pom` like
  https://github.com/apache/ant-antlibs-compress/blob/master/project-template.pom
