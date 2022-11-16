# Nvpro Core
## License
See [LICENSE](LICENSE) and licenses within source code for details.

## Repository
This folder is a repository of *shared source code* : most other samples use it as library or directly reference code from it.

It means that you must clone this repository (with submodules) prior to trying those samples that refer to this repository as dependency.

## Folders
* **cmake**: 'find' files to search for cmake packages
* **doxygen**: folder for doxygen doc generation
* **fileformats**: various helpers to load some files
* **nvh**: API agnostic helpers to simplify the code of samples.
* **nvgl**: helpers for OpenGL
* **nvvk**: helpers for Vulkan (to aid extension use and simplify initialization of Vulkan structs, some files were generated from scripting)
* **nvoptix**: helpers for Optix
* **nvdx12**: helpers for DirectX 12
* **nvmath**: math library used by most samples
* **imgui**: a version of [imgui](https://github.com/ocornut/imgui) and some implementations to render it (derived from its examples).
* **GL/KHR**: include files for OpenGL (we use a subset of extensions that is generated and defined by `nvgl/extensions_gl.lua`)
* resources: icons etc.

## Files
* **nvpsystem\[_linux|win32\].hpp/cpp**: defines the base class NVPSystem
* **nvpwindow.hpp/cpp**: defines the main class NVPWindow
* **docgen.py**: python script that generates README.md files from comments gathered in various headers
* **CMakeLists.txt**: project definition for the nvpro_core library
* **resources...**: win32 resources
* **include_gl.h**: shortcut for including the file that contains the GL extension definitions
* **platform.h / NvFoundation.h**: platform specific `NV_...` macros that aid cross platform coding

## Dependencies
Some samples may rely on few additional libraries in order to compile (mostly for win32). You can find them in [third_party/binaries](https://github.com/nvpro-samples/third_party_binaries). The use of Vulkan or DirectX APIs requires that the appropriate SDKs are installed.

The minimum Vulkan SDK version is currently: 1.2.135.0

## Third Party
This project embeds several open-source libraries and/or code derived from them.
See the `third_party` directory for further details.

Code from the following projecs was derived from and is part of files outside
`third_party`

#### OpenGL Samples Pack
The include file mechanism inside `nvh/shaderfilemanager.cpp` is derived from this
framework.

[website](https://github.com/g-truc/ogl-samples)

````
Copyright (c) 2005 - 2015 G-Truc Creation (www.g-truc.net)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
THE USE OR OTHER DEALINGS IN THE SOFTWARE.
````

#### boost
- only the hash combine logic was derived
- https://www.boost.org/doc/libs/1_35_0/doc/html/boost/hash_combine_id241013.html

````
Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
````

