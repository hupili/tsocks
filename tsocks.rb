require 'formula'

class Tsocks < Formula
  # The original is http://tsocks.sourceforge.net/
  # This GitHub repo is a maintained fork with OSX support
  #homepage 'http://github.com/pc/tsocks'
  #head 'https://github.com/pc/tsocks.git'
    
  # A self contained tsocks library with brew formula
  homepage 'http://github.com/hupili/tsocks'
  head 'https://github.com/hupili/tsocks.git'

  depends_on 'autoconf' => :build if MacOS.xcode_version.to_f >= 4.3

  def install
    system "autoconf", "-v"
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--with-conf=#{config_file}"

    inreplace("tsocks") { |bin| bin.change_make_var! "LIBDIR", "#{prefix}/lib" }

    system "make"
    system "make install"

    etc.install "tsocks.conf.simple.example" => "tsocks.conf" unless config_file.exist?
  end

  def test
    puts 'Your current public ip is:'
    ohai `curl -sS ifconfig.me 2>&1`.chomp
    puts "If your correctly configured #{config_file}, this should show the IP you have through the proxy"
    puts 'Your IP through the proxy is:'
    ohai `tsocks curl -sS ifconfig.me 2>&1`.chomp
  end

  def config_file
    etc / 'tsocks.conf'
  end
end
