/*
  Version 0.0.1 2017/01/09
  Copyright 2017 NVISO

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  https://www.nviso.be

  History:
    2017/01/09: start
*/

import "pe"

rule py2exe
{
  meta:
        author = "Didier Stevens (https://www.nviso.be)"
        description = "Detect PE file produced by py2exe"
  condition:
        for any i in (0 .. pe.number_of_resources - 1):
          (pe.resources[i].type_string == "P\x00Y\x00T\x00H\x00O\x00N\x00S\x00C\x00R\x00I\x00P\x00T\x00")
}

rule PE_File_pyinstaller
{
    meta:
        author = "Didier Stevens (https://DidierStevens.com)"
        description = "Detect PE file produced by pyinstaller"
    strings:
        $a = "pyi-windows-manifest-filename"
    condition:
        pe.number_of_resources > 0 and $a
}
