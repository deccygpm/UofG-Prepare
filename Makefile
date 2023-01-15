build-models:
	flutter pub run build_runner build

fix-pods:
	flutter clean
	rm -Rf ios/Pods
	rm -Rf ios/.symlinks
	rm -Rf ios/Flutter/Flutter.framework
	rm -Rf ios/Flutter/Flutter.podspec
	flutter pub get
	cd ios
	arch -x86_64 pod install
	cd ..

icons:
	flutter pub get
	flutter pub run flutter_launcher_icons