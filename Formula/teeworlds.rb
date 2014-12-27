require 'formula'

class Teeworlds < Formula
  homepage 'https://www.teeworlds.com'
  url 'https://downloads.teeworlds.com/teeworlds-0.6.3-src.tar.gz'
  sha1 'f4dd6a9ad1e410bf973a1cc6f911f3dc08e08d39'

  depends_on 'sdl'
  depends_on 'bam' => :build

  def install
    system "bam release"
    (bin+'teeworlds').write <<-EOS.undent
      #!/bin/sh
      exec #{libexec}/teeworlds
    EOS
    rm_rf "src"
    rm_rf "objs"
    libexec.install Dir['*']
  end
end
