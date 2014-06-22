require 'formula'

class Gtkx3Quartz < Formula
  homepage 'http://gtk.org/'
  url 'http://ftp.gnome.org/pub/gnome/sources/gtk+/3.8/gtk+-3.8.1.tar.xz'
  sha256 'f43e7c7d7a0e2417225509e88f67799534c69abfbb6f615fc7a895bf15e31255'

  depends_on 'pkg-config' => :build
  depends_on 'xz' => :build
  depends_on 'glib'
  depends_on 'jpeg'
  depends_on 'libtiff'
  depends_on 'gdk-pixbuf'
  depends_on 'pango-quartz'
  depends_on 'cairo-quartz'
  depends_on 'atk'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-glibtest",
                          "--disable-introspection",
                          "--enable-quartz-backend",
                          "--enable-quartz-relocation"

    system "make install"
    # Prevent a conflict between this and Gtk+2
    mv bin/'gtk-update-icon-cache', bin/'gtk3-update-icon-cache'
  end

  def test
    system "#{bin}/gtk3-demo"
  end
end
