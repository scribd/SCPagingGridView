SCPagingGridView
===

SCPagingGridView is a collection of iOS UIViewController containers, views, & helpers. The project is comprised of the following components:

SCPageViewController
---
A custom page view controller that supports both horizontal & vertical paging.

SCGridView
---
A UIView sublcass that lays out it's children according to a given schema.

SCPagingGridViewController
---
A view controller container that supports laying out a series of cells in pageable grid views.

Screen shot:
<img src="http://static.scribd.com.s3.amazonaws.com/github/paging_gridview_iphone.png" height="480" width="320" alt="iPhone example" />

SCViewRecycler
---
A class that recycles views. It is similar to UITableView's reusable cells system, but can be used for any view type.

Usage
---

To use SCPagingGridView, add the ``` source/ ``` files into your XCode Project. The preferred method is to setup a git submodule and reference the files in your Xcode project. ` git submodule add https://github.com/scribd/SCPagingGridView.git SCPagingGridView `

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
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
 ```