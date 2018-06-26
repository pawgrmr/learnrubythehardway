# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "hello"
  spec.version       = '1.0'
  spec.authors       = ["Manasi"]
  spec.email         = ["iam@manasi.me"]
  spec.summary       = %q{Script exercise}
  spec.description   = %q{Make a ruby script and run it through bash}
  spec.homepage      = "http://domainforproject.com/"
  spec.license       = "MIT"

  spec.files         = ['lib/hello.rb']
  spec.executables   = ['/hello']
  spec.test_files    = ['tests/test_hello.rb']
  spec.require_paths = ["lib"]
end