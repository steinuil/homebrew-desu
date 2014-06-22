require 'formula'

class GstPluginsBaseQuartz < Formula
  homepage 'http://gstreamer.freedesktop.org/'
  url 'http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.0.6.tar.xz'
  mirror 'http://ftp.osuosl.org/pub/blfs/svn/g/gst-plugins-base-1.0.6.tar.xz'
  sha256 '85e5f99af690f720ccde5ea7e793269d35883a3ead80ca9985fa44e18bb1a4a5'

  depends_on 'pkg-config' => :build
  depends_on 'xz' => :build
  depends_on 'gettext'
  depends_on 'gstreamer'
  depends_on 'gtk+-quartz'
  depends_on 'pango-quartz'
  depends_on 'libogg'
  depends_on 'theora'
  depends_on 'libvorbis'
  depends_on 'orc'

  depends_on 'gobject-introspection' => :optional

  def install
    # gnome-vfs turned off due to lack of formula for it.
    args = %W[
      --prefix=#{prefix}
      --disable-debug
      --disable-dependency-tracking
      --enable-experimental
      --disable-libvisual
      --disable-alsa
      --disable-cdparanoia
      --without-x
      --disable-x
      --disable-xvideo
      --disable-xshm
    ]
    system "./configure", *args
    system "make"
    system "make install"
  end
end
