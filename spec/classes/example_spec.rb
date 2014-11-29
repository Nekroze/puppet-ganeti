require 'spec_helper'

describe 'ganeti' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "ganeti class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('ganeti::params') }
        it { should contain_class('ganeti::install').that_comes_before('ganeti::config') }
        it { should contain_class('ganeti::config') }
        it { should contain_class('ganeti::service').that_subscribes_to('ganeti::config') }

        it { should contain_service('ganeti') }
        it { should contain_package('ganeti').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'ganeti class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('ganeti') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
