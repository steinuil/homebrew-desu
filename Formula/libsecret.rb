require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Libsecret < Formula
  homepage ''
  url 'http://ftp.gnome.org/pub/gnome/sources/libsecret/0.14/libsecret-0.14.tar.xz'
  sha1 'd6a3bc3601fd8d2e7e8aa28bef70b1fe453d3803'

  depends_on 'pkg-config' => :build
  depends_on 'xz' => :build
  depends_on 'glib'
  depends_on 'intltool'
  depends_on 'libgcrypt'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--disable-manpages"

    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "false"
  end
end
