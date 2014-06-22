require "formula"

class ArxLibertatis < Formula
  homepage "http://arx-ibertatis.org/"
  url "arx-libertatis.org/files/arx-libertatis-1.1.2.tar.xz"
  sha1 "3b14a55553c564fd33caafb3a5bdb2d328e1fde8"
  head "https://github.com/arx/ArxLibertatis.git"

  depends_on "cmake" => :build
  depends_on "sdl"
  depends_on "glew"
  depends_on "boost" => :build
  depends_on "glm" => :build
  depends_on "freetype"
  depends_on "innoextract" => :recommended

  def install
    mkdir "build" do
     system "cmake", "..", *std_cmake_args
     system "make"
     system "make install"
    end
  end

  def caveats; <<-EOS.undent
    This package only contains the Arx Libertatis binary, not the game data.
    To play Arx Fatalis you will need to obtain the game from GOG.com and install
    the game data with:

      arx-install-data /path/to/setup_arx_fatalis.exe
    EOS
  end
end
