require 'formula'

class Scummvm < Formula
  url 'https://downloads.sourceforge.net/project/scummvm/scummvm/1.6.0/scummvm-1.6.0.tar.bz2'
  homepage 'http://www.scummvm.org/'
  sha1 'cb64b2be5c867259b4290e94542f27b00c2de79f'
  head 'https://github.com/scummvm/scummvm'
  devel 'http://buildbot.scummvm.org/snapshots/master/osx_intel-master-latest.tar.xz'

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
