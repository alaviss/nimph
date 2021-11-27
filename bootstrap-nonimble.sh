#!/bin/sh

RELEASE="release"

mkdir -p temporary
cd temporary

git clone --depth 1 --branch 1.8.29 https://github.com/disruptek/bump.git
git clone --depth 1 --branch 1.1.2 https://github.com/disruptek/cutelog.git
git clone --depth 1 --branch 3.0.0 https://github.com/disruptek/gittyup.git
git clone --depth 1 --branch v0.6.13 https://github.com/genotrance/nimterop.git
git clone --depth 1 --branch v1.5.19 https://github.com/c-blake/cligen.git
git clone --depth 1 --branch 0.25.0 https://github.com/zevv/npeg.git
git clone --depth 1 --branch 1.0.2 https://github.com/disruptek/jsonconvert.git
git clone --depth 1 --branch 2.1.3 https://github.com/disruptek/badresults.git
git clone --depth 1 --branch 2.0.4 https://github.com/disruptek/github.git
git clone --depth 1 --branch 1.0.5 https://github.com/disruptek/rest.git
git clone --depth 1 --branch 1.0.2 https://github.com/disruptek/foreach.git
git clone --depth 1 --branch 0.0.7 https://github.com/disruptek/ups.git
git clone --depth 1 --branch 0.5.3 https://github.com/disruptek/grok.git
git clone --depth 1 --branch 0.1.6 https://github.com/haxscramper/hlibgit2.git
git clone --depth 1 --branch 0.1.5 https://github.com/haxscramper/hlibssh2.git
nim c --outdir:.. --define:$RELEASE --path:../src --path:hlibgit2 --path:hlibssh2 --path:ups --path:cligen --path:foreach --path:github/src --path:rest --path:npeg/src --path:jsonconvert --path:badresults --path:bump --path:cutelog --path:gittyup --path:grok ../src/nimph.nim
cd ..

if test -x nimph; then
  echo "nimph built successfully"
  echo "you can safely remove the 'temporary' subdirectory"
else
  echo "unable to build nimph"
  exit 1
fi
