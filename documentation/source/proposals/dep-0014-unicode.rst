*******
Unicode
*******

===============  =============================================
DEP #:           14
Type:            Standards Track
Affects-DRM:     Yes
Author:          Peter S. Housel
Status:          Draft
Created:         21-Apr-2026
Last-Modified:   21-Apr-2026
Post-History:    None
Target-Version:  2026.2
===============  =============================================


Abstract
========

This proposal changes the :lib:`dylan` library, along with other
associated system libraries, to support Unicode as it is currently used.

Specification
=============

The following sections define the changes to the :lib:`dylan` library
and other core libraries.

``dylan`` Library
-----------------

.. current-library:: dylan
.. current-module:: dylan

This proposal includes modifications to the base :lib:`dylan` library
as defined in the *Dylan Reference Manual* to explicitly specify its
relationship with the Unicode standard. It also changes the default
:drm:`<string>` class to be immutable, and provides mechanisms for
constructing immutable strings.

Characters
^^^^^^^^^^

The definition of :drm:`<character>` is modified as follows:

.. class:: <character>
   :sealed:

   The class of characters representing code points in the Unicode
   code space.

   :superclasses: :drm:`<object>`

   :description:

      The class of characters corresponding to the entire range of
      code points from U+0000 through U+10FFFF as defined by the
      Unicode standard core specification.

   :operations:

      The following operations on :drm:`<character>` objects are
      supported:

      - :gf:`<`
      - :gf:`as-uppercase`
      - :gf:`as-lowercase`
      - :gf:`as`

Strings
^^^^^^^

The definition of :drm:`<string>` is modified as follows:

.. class:: <string>
   :open:
   :abstract:
   :instantiable:

   The class of sequences with elements that are Unicode characters.

   :superclasses: :drm:`<sequence>`

   :keyword size: An instance of :drm:`<integer>` specifying the size
                  of the string, with a default value of 0.
   :keyword fill: An instance of type :drm:`<character>` specifying the value for each element, with a default value of ``' '`` (U+0020 SPACE).

   :description:

      The :class:`<string>` class represents a sequence of Unicode
      characters. It has no direct instances; :drm:`make` on
      :class:`<string>` will return an instance of an immutable
      concrete subclass.

      The element type of :class:`<string>` is :class:`<character>`.

The :drm:`<byte-string>` and :drm:`<unicode-string>` concrete classes
are removed.

Methods of :drm:`as-uppercase!` and :drm:`as-lowercase!` are no longer
provided for the default string classes, as they do not represent
mutable collections.

The :drm:`as-uppercase` and :drm:`as-lowercase` functions are not
recommended for general text strings because they only implement a
simple character-by-character case mapping, rather than a
language-specific (or locale-specific) case conversion.

A method for :drm:`limited` specialized on ``limited(<string>)`` is no
longer provided.

String Construction
^^^^^^^^^^^^^^^^^^^

Instances of :class:`<string-builder>` can be used to construct
immutable strings.

.. class:: <string-builder>
  :sealed:

   The class of objects maintaining state during the construction of
   :class:`<string>` instances.

   :superclasses: :class:`<mutable-sequence>` :class:`<stretchy-collection>`

   :keyword byte-capacity: An instance of :drm:`<integer>` giving the initial storage capacity of the builder for storing UTF-8 encoding bytes, with a default value of 0.

   :description:

      The :class:`<string-builder>` class represents a state object
      used for constructing immutable instances of :class:`<string>`.

      For efficiency, at construction time a ``byte-capacity:`` can be
      specified, giving an estimate of the number of UTF-8 bytes the
      builder will require. Storage will grow automatically as needed.

    :operations:

      - :gf:`add!`
      - :gf:`concatenate!`
      - :gf:`as`

Concatenation
^^^^^^^^^^^^^

The :gf:`concatenate!` function (previously provided in
:mod:`common-extensions`) is provided for use with
:class:`<string-builder>` as well as for other uses

.. generic-function:: concatenate!
   :open:

``common-dylan`` Library
------------------------

This proposal adds a new :mod:`string-encoding` module to the
:lib:`common-dylan` library.

.. current-library:: common-dylan
.. current-module:: string-encoding

:class:`<string-builder>` Operations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following functions add encoded bytes to a :class:`<string-builder>`.

``collections`` Library
--------------


``io`` Library
--------------


``system`` Library
------------------


Motivation
==========

The language defined in the Dylan Reference Manual reflected the
practice for text representation of its time, suppporting both
byte-oriented single-byte character sets and multi-byte character
sets, along with the original UCS-2 (16-bit) version of
Unicode. Subsequent to this, however, software systems have evolved in
a number of ways:

- Unicode UCS-2 is no longer adequate for representing the entire
  repertoire of the Unicode Character Set, which defines code points
  ranging from 0 through #x10FFFF.

- The UTF-8 encoding of Unicode has become the most common text
  representation on the Web, in file I/O, and in programming interfaces.

The facilities within the Dylan Reference Manual did not take
internationalized text processing into account. Though this is a large
area beyond the scope of the :lib:`dylan` library itself, the base
language definition and the core associated system libraries should be
designed to work well in concert with specialized text processing
libraries.

This proposal follows the example of languages such as Python, Go, and
Rust in choosing to treat text strings as sequences of Unicode code
points, following the Unicode principle of representing "characters,
not glyphs". Other programming languages such as Swift take a
different approach, choosing to explicitly embody the concept of a
*grapheme cluster*. We did not choose to do this, as segmentation into
graphemes can sometimes depend on the application, and because we wish
minimize the amount of character database information that needs to be
provided by the base run-time libraries.

Rationale
=========

Backwards Compatibility
=======================

This proposal sacrifices backward compatibility in a number of areas:

- Code that referenced the :drm:`<byte-string>` and
  :drm:`<unicode-string>` classes is no longer acccepted.

- Code can no longer expect that strings are mutable and can be
  constructed by assigning or replacing elements, and must instead use
  :class:`<string-builder>` or a higher-level method such as
  :macro:`with-output-to-string`.

- Code can no longer assume that accessing random elements of a string
  happens in constant time. Sequential access to string elements should use
  :drm:`forward-iteration-protocol` (or :drm:`backward-iteration-protocol`).

- The implementation of file streams previously made no accomodation
  for different character set encodings.

Reference Implementation
========================

The current reference implementation may be found at `the author's unicode-support-2026 branch <https://github.com/housel/opendylan/tree/unicode-support-2026>`_.

Copyright
=========

This document may be freely redistributed.
