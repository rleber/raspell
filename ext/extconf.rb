require "mkmf"

 have_header("ruby.h")
 have_header("aspell.h")
 have_library("aspell")
#require 'rbconfig'

HERE = File.expand_path(File.dirname(__FILE__))

File.open(ENV['HOME'] + '/.raspell_extconf.log','w') do |f|
  f.puts "pwd=#{`pwd`.inspect}"
  f.puts "Directory contents:\n#{`ls -l`}"
  f.puts "HERE=#{HERE.inspect}"
  f.puts "$ARCH_FLAG=#{$ARCH_FLAG.inspect}"
  f.puts "$CFLAGS=#{$CFLAGS.inspect}"
  f.puts "$CPPFLAGS=#{$CPPFLAGS.inspect}"
  f.puts "$CXXFLAGS=#{$CXXFLAGS.inspect}"
  f.puts "$DEFLIBPATH=#{$DEFLIBPATH.inspect}"
  f.puts "$DLDFLAGS=#{$DLDFLAGS.inspect}"
  f.puts "$EXTRA_CONF=#{$EXTRA_CONF.inspect}"
  f.puts "$LDFLAGS=#{$LDFLAGS.inspect}"
  f.puts "$LIBPATH=#{$LIBPATH.inspect}"
  f.puts "$LIBS=#{$LIBS.inspect}"
  f.puts "ENV['DEBUG']=#{ENV['DEBUG'].inspect}"
  f.puts "ENV['EXTERNAL_LIB']=#{ENV['EXTERNAL_LIB'].inspect}"
  f.puts "ENV['SWIG']=#{ENV['SWIG'].inspect}"
end
 
$CFLAGS = "#{RbConfig::CONFIG['CFLAGS']} #{$CFLAGS}".gsub("$(cflags)", "").gsub("-fno-common", "")
$LDFLAGS = "#{RbConfig::CONFIG['LDFLAGS']} #{$LDFLAGS}".gsub("$(ldflags)", "").gsub("-fno-common", "")
$CXXFLAGS = " -std=gnu++98 #{$CFLAGS}"
$CPPFLAGS = $ARCH_FLAG = $DLDFLAGS = ""
#  
# if ENV['DEBUG']
#   puts "Setting debug flags."
#   $CFLAGS << " -O0 -ggdb -DHAVE_DEBUG"
#   $EXTRA_CONF = ""
# end
#  
# if !ENV["EXTERNAL_LIB"]
  $includes = " -I#{HERE}/include"
#  $defines = " -DLIBMEMCACHED_WITH_SASL_SUPPORT"
  $libraries = " -L#{HERE}/lib"
  $CFLAGS = "#{$includes} #{$libraries} #{$CFLAGS}"
  $LDFLAGS = "#{$libraries} #{$LDFLAGS}"
  $LIBPATH = ["#{HERE}/lib"]
  $DEFLIBPATH = []
#   Dir.chdir(HERE) do
#      if File.exist?("lib")
#        puts "Raspell already built; run 'rake clean' first if you need to rebuild."
#      else
#        Dir.chdir(BUNDLE_PATH) do
#          puts(cmd = "env CFLAGS='-fPIC #{$CFLAGS}' LDFLAGS='-fPIC #{$LDFLAGS}' ./configure --prefix=#{HERE} --without-memcached --disable-shared --disable-utils --disable-dependency-tracking #{$EXTRA_CONF} 2>&1")
#          raise "'#{cmd}' failed" unless system(cmd)
# 
#          puts(cmd = "make CXXFLAGS='#{$CXXFLAGS}' || true 2>&1")
#          raise "'#{cmd}' failed" unless system(cmd)
# 
#          puts(cmd = "make install || true 2>&1")
#          raise "'#{cmd}' failed" unless system(cmd)
#        end
# 
#        system("rm -rf #{BUNDLE_PATH}") unless ENV['DEBUG'] or ENV['DEV']
#      end
#    end 
#  end
  
  # Absolutely prevent the linker from picking up any other libmemcached
#  Dir.chdir("#{HERE}/lib") do
#    system("cp -f libraspell.a libraspell_gem.a")
#    system("cp -f libraspell.la libraspell_gem.la")
#  end
#  $LIBS << " -lraspell"
# end
#  
# if ENV['SWIG']
#   puts "Running SWIG."
#   puts(cmd = "swig #{$defines} #{$includes} -ruby -autorename rlibmemcached.i")
#   raise "'#{cmd}' failed" unless system(cmd)
#   puts(cmd = "sed -i '' 's/STR2CSTR/StringValuePtr/' rlibmemcached_wrap.c")
#   raise "'#{cmd}' failed" unless system(cmd)
# end

create_makefile("raspell")
