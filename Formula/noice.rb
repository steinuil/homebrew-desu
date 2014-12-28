class Noice < Formula
  homepage "http://git.2f30.org/noice/about/"
  url "http://git.2f30.org/noice/snapshot/noice-0.1.tar.gz"
  sha1 "823e7b9385f42beec639bd0a20813e2d306205d2"
  head "git://git.2f30.org/noice"

  def install
    inreplace "Makefile", "/usr/local", "#{prefix}"
    inreplace "Makefile", "$(PREFIX)/man", "#{man}"
    system "make", "install"
  end
end
