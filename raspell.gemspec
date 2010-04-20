# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{raspell}
  s.version = "1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = [""]
  s.cert_chain = ["/Users/richard/projects/tools_development/config/gem_cert/gem-public_cert.pem"]
  s.date = %q{2010-03-22}
  s.description = %q{An interface binding for the Aspell spelling checker.}
  s.email = %q{}
  s.extensions = ["ext/extconf.rb"]
  s.extra_rdoc_files = ["lib/raspell_stub.rb", "README", "LICENSE", "CHANGELOG"]
  s.files = ["test/simple_test.rb", "lib/raspell_stub.rb", "ext/raspell.h", "ext/raspell.c", "ext/extconf.rb", "README", "LICENSE", "CHANGELOG", "raspell.gemspec", "Rakefile"]
  s.homepage = %q{http://blog.evanweaver.com/files/doc/fauna/raspell/}
  s.require_paths = ["lib", "ext"]
  s.rubyforge_project = %q{fauna}
  s.rubygems_version = %q{1.3.6}
  s.signing_key = %q{/Users/richard/projects/tools_development/config/gem_cert/gem-private_key.pem}
  s.summary = %q{An interface binding for the Aspell spelling checker.}
  s.test_files = ["test/simple_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
