XCODEBUILD:=xcodebuild

default: build test example

build:
	$(XCODEBUILD) -scheme FeedlyKit-iOS
	$(XCODEBUILD) -scheme FeedlyKit-macOS
	$(XCODEBUILD) -scheme FeedlyKit-tvOS
	$(XCODEBUILD) -scheme FeedlyKit-watchOS

test:
	$(XCODEBUILD) -scheme FeedlyKit-macOS test

example:
	pod setup
	pod install --project-directory=Example
	$(XCODEBUILD) -scheme FeedlyKitExample -sdk iphonesimulator -workspace Example/FeedlyKitExample.xcworkspace/

clean:
	$(XCODEBUILD) -scheme FeedlyKit-iOS clean -sdk iphonesimulator
	$(XCODEBUILD) -scheme FeedlyKit-macOS clean
	$(XCODEBUILD) -scheme FeedlyKit-tvOS clean
	$(XCODEBUILD) -scheme FeedlyKit-watchOS clean

lint:
	swiftlint

.PHONY: test example clean default
