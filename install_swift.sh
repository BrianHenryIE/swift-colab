# Download Swift

if [[ ! -d /swift ]]
then
  mkdir /swift
fi

cd /swift

if [[ ! -d toolchain ]]
then  
  # $1 is the Swift version (e.g. 5.5.2)
  tar_file="swift-$1-RELEASE-ubuntu18.04"
  
  curl "https://download.swift.org/swift-$1-release/ubuntu1804/swift-$1-RELEASE/${tar_file}.tar.gz" | tar -xz
  mv "${tar_file}" toolchain
fi

# Execute setup script

if [[ -d swift-colab ]]
then
  rm -r swift-colab
fi

git clone --single-branch -b main https://github.com/philipturner/swift-colab

export PATH="/swift/toolchain/usr/bin:$PATH"
swift swift-colab/install_swift.swift

python3 /swift/swift-colab/test-why-not-import.py
echo "finishing python test"
