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

        it { should contain_service('ganeti')  }
      end
    end
  end
end
