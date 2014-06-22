require 'formula'

# Use a mirror because of:
# http://lists.cairographics.org/archives/cairo/2012-September/023454.html

class CairoQuartz < Formula
  homepage 'http://cairographics.org/'
  url 'http://cairographics.org/releases/cairo-1.12.14.tar.xz'
  mirror 'https://downloads.sourceforge.net/project/machomebrew/mirror/cairo-1.12.14.tar.xz'
  sha256 '96d0d1e3f9b74d2ca3469ff187c5e5f25649b1ad35cf06f4f3a83847dff4ac13'

  keg_only :provided_pre_mountain_lion

  env :std if build.universal?

  depends_on 'pkg-config' => :build
  depends_on 'xz'=> :build

  depends_on :libpng
  depends_on 'pixman'
  depends_on 'glib'
  depends_on 'freetype'
  depends_on 'fontconfig'

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --with-x
      --enable-ft=yes
      --enable-fc=yes
      --enable-xlib=no
    ]
    
    args << '--enable-xcb=no' if MacOS.version == :leopard

    system "./configure", *args
    system "make install"
  end
end
