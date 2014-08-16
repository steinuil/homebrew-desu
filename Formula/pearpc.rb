require "formula"

class Pearpc < Formula
  homepage "http://pearpc.sourceforge.net"
  url "https://downloads.sourceforge.net/project/pearpc/pearpc/0.5.0/pearpc-0.5.tar.bz2"
  sha1 "a4c37a93e5037a6934ead188b6421e9ea486f92e"

  depends_on :arch => :intel
  depends_on "sdl" if build.without? :x11
  depends_on :x11 => :optional

  def install
  args << "--enable-ui=sdl" if build.without? :x11
  args << "--enable-ui=x11" if build.with? :x11

    system "./configure", "--enable-cpu=generic",
                          *args
    system "make", "install"
  end
end
