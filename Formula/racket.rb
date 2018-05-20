class Racket < Formula
  desc "Modern programming language in the Lisp/Scheme family"
  homepage "http://racket-lang.org/"
  url "https://download.racket-lang.org/releases/6.12/installers/racket-minimal-6.12-src-builtpkgs.tgz"
  version "6.12"
  sha1 "5acf20dc40c2586cd7c6917ec16cfb86908efe79"

  patch :p0, :DATA

  def install
    cd "src" do
      args = ["--disable-debug", "--disable-dependency-tracking",
              "--enable-macprefix",
              "--prefix=#{prefix}",
              "--man=#{man}"]

      args << "--disable-mac64" unless MacOS.prefer_64_bit?

      system "./configure", *args
      system "make"
      system "make", "install"
    end
  end

  def caveats; <<-EOS.undent
    This is a minimal Racket distribution.
    If you want to use the DrRacket IDE, we recommend that you use
    the PLT-provided packages from http://racket-lang.org/download/.
    EOS
  end

  test do
    output = `'#{bin}/racket' -e '(displayln "Hello Homebrew")'`
    assert $?.success?
    assert_match /Hello Homebrew/, output
  end
end

__END__
--- src/racket/src/schpriv.h
+++ src/racket/src/schpriv.h
@@ -22,6 +22,7 @@
 
 #include "scheme.h"
 #include "longdouble/longdouble.h"
+#include <sys/types.h>
 
 #ifdef CIL_ANALYSIS
 #define ROSYM          __attribute__((__ROSYM__))
