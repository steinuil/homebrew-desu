require 'formula'

class Scummvm < Formula
  url 'https://downloads.sourceforge.net/project/scummvm/scummvm/1.7.0/scummvm-1.7.0.tar.bz2'
  homepage 'http://www.scummvm.org/'
  sha1 'a16c84f457b6cdb405739eab72c2106f4674bc75'
  head 'https://github.com/scummvm/scummvm.git'

  depends_on 'sdl'
  depends_on :libpng
  depends_on 'flac' => :recommended
  depends_on 'libvorbis' => :recommended
  depends_on 'libogg' => :recommended
  depends_on 'fluid-synth' => :optional

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug"
    system "make"
    system "make install"
    (share+'pixmaps').rmtree
  end
end
