module: gsk-properties
synopsis: generated bindings for the Gsk library
copyright: See LICENSE file in this distribution.

define property-getter surface :: <GdkSurface> on <GskRenderer> end;
define property-getter realized :: <C-boolean> on <GskRenderer> end;
define property-setter source :: <GBytes> on <GskGLShader> end;
define property-getter source :: <GBytes> on <GskGLShader> end;
define property-setter resource :: <C-string> on <GskGLShader> end;
define property-getter resource :: <C-string> on <GskGLShader> end;
