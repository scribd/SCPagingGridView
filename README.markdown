SCPagingGridView
===

SCPagingGridView is a collection of iOS UIViewController containers.

Components
---

* SCPageViewController - A page view controller that supports both horizontal & vertical paging
* SCGridView - A UIView sublcass that lays out it's children according to a given schema
* SCPagingGridViewController - A view controller container that supports laying out a series of cells in pageable grid views

Usage
---

The easiest way to use SCPagingGridView is to copy the ``` source/ ``` files into your XCode Project.

Alternatively, you can setup a git submodule and reference the files in your Xcode project. I prefer this method as it enables you to receive bugfixes/updates for the project.

Requirements
---

SCPagingGridView requires iOS 5.0+ and Xcode 4.3+ The projects uses ARC, but it may be used with non-ARC projects by setting the: ` -fobjc-arc ` compiler flag on the ` *.m ` files. You can set this flag under Target -> Build Phases -> Compile Sources

Apps
---
SCPagingGridView is used in the following apps:

* Scribd - [http://itunes.apple.com/us/app/scribd-worlds-largest-online/id542557212?ls=1&mt=8](http://itunes.apple.com/us/app/scribd-worlds-largest-online/id542557212?ls=1&mt=8)

License
---

```

 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 of the Software, and to permit persons to whom the Software is furnished to do
 so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 If you happen to meet one of the copyright holders in a bar you are obligated
 to buy them one pint of beer.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
 ```