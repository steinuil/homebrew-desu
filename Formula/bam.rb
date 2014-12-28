class Bam < Formula
  homepage "https://teeworlds.com"
  url "http://teeworlds.com/files/bam-0.4.0.zip"
  sha1 "d83e277a98aa2a1f3b752ebd19521a26087f5f02"

  def install
    system "./make_unix.sh"
    bin.install "bam"
  end
end
