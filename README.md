MDSpreadView Demo
=================

![Screenshot](https://github.com/mochidev/MDSpreadViewDemo/raw/master/Artwork/Screenshot.png)

Purpose
-------

`MDSpreadView` is a rewrite of `UIKit`'s `UITableView` that allows for the display
of columns and column headers as well as rows. This repository serves to 
demonstrate and test the `MDSpreadView` class. Please visit the
[MDSpreadView](https://github.com/mochidev/MDSpreadView) repository for the 
actual code :)

Installation
------------

```bash
$ git clone https://github.com/mochidev/MDSpreadViewDemo --recursive
```

To include it into your projects either download the
[source](https://github.com/mochidev/MDSpreadView), or run the following
on your git repo:

```bash
$ cd <your_repo>
$ git submodule add git@github.com:mochidev/MDSpreadView.git <local_subpath>/MDSpreadView
```

This will allow you to update it at anytime by running `$ git submodule update`.

Usage
-----

Simply add the
[MDSpreadView](https://github.com/mochidev/MDSpreadView) submodule to
your project, add `#import "MDSpreadViewClasses.h"` to the top of the files you 
wish to use `MDSpreadView` in, and set the `delegate` and `dataSource` properties
of your `MDSpreadView` instance to one of your objects, much like you would do 
for a `UITableView`.

Then, implement the datasource and delegate methods demonstrated in `MDViewController.m`.

Don't forget to add `QuartzCore.framework` to your project!

Notes
-----

 - An `MDSpreadViewCell` is created just like a `UITableViewCell` is -- try to 
 dequeue it from the spread view, otherwise create a new one, then 
 configure and return.
 - The table headers are also made of cells, and are loaded just like 
 MDTableViewCells are.
 - Works flawlessly with ~500 billion data points (anything bigger makes `- reloadData` hang).
 - The bigger the cells, the faster it scrolls, since less are onscreen at a 
 time (especially on older hardware).
   - ~150 cells gives 60 fps on current hardware, though you can viably push to 600 cells for ~25 fps
 - `MDSpreadView` uses `MDIndexPath`s *instead* of `NSIndexPath` to index cells.
 - Not all APIs are fully implemented yet, and are there for future reference only.
 - `MDSpreadView` also offers an easier way to make cells via `- spreadView:title...`
 and `- spreadView:objectValue...` datasource methods. The cell classes used can be
 changed via the `default...CellClass` quartet of properties.
 - `MDSpreadView` also has support for footer columns and rows.
 - Unlike UITableView, MDSpreadView is not adversely affected by custom cell sizes.

To Do
-----

 - Programatic scrolling
 - Info Querying
 - Copy-Paste menu support
 - Cell insertion, deletion, and reload
 - Class registration per identifier
 - Better animation between data set transitions

Coding Style Guidelines
-----------------------

Please see https://mochidev.com/codestyle

License
-------

Copyright (c) 2014 Dimitri Bouniol, Mochi Development, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software, associated artwork, and documentation files (the "Software"),
to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

1. The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
2. Neither the name of Mochi Development, Inc. nor the names of its
 contributors or products may be used to endorse or promote products
 derived from this software without specific prior written permission.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

Mochi Dev, and the Mochi Development logo are copyright Mochi Development, Inc.

Also, it'd be super awesome if you credited this page in your about screen :)

(We do this for you in [MDAboutController](https://github.com/mochidev/MDAboutControllerDemo)!)

Credits
-------

- Created by [Dimitri Bouniol](http://twitter.com/dimitribouniol) for [Mochi Development, Inc.](http://mochidev.com/)
- Contributed to by [Sonny Fazio](https://github.com/sonnyfazio) of [SonsterMedia](https://sonstermedia.com)
