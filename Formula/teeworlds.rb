class Teeworlds < Formula
  homepage "https://www.teeworlds.com"
  url "https://downloads.teeworlds.com/teeworlds-0.6.3-src.tar.gz"
  sha1 "f2dea0d14c4a8c817c658bd75dbe175b37ed70bd"

  depends_on "sdl"
  depends_on "bam" => :build

  def install
    system "bam release"
    (bin+"teeworlds").write <<-EOS.undent
      #!/bin/sh
      exec #{libexec}/teeworlds
    EOS
    rm_rf "src"
    rm_rf "objs"
    libexec.install Dir["*"]
  end
end
