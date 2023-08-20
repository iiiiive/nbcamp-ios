![썸네일](.github/resources/Banner.png)
# NBCamp iOS

- [NBCamp 위키 바로가기](https://github.com/iiiiive/nbcamp-ios/wiki)

## Members

|![yujinkim1](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/26790710?v=4&h=150&w=150)|![seojinkim112211](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/134287588?v=4&h=150&w=150)|![hw-devlog](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/139093066?v=4&h=150&w=150)|![aera11](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/139456385?v=4&h=150&w=150)|![YoungKunChoi](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/139095481?v=4&h=150&w=150)|
|:---:|:---:|:---:|:---:|:---:|
|[김유진](https://github.com/yujinkim1)|[김서진](https://github.com/seojinkim112211)|[이현우](https://github.com/hw-devlog)|[이애라](https://github.com/aera11)|[최영군](https://github.com/YoungKunChoi)|

## Architecture

![Architecture](.github/resources/Architecture.png)

## Application Layer

![Application-Layer](.github/resources/Application_Layer.png)

## File Structures

```bash
.
├── NBCamp
│   ├── Application
│   │   ├── AppDelegate.swift
│   │   └── SceneDelegate.swift
│   ├── Info.plist
│   ├── Model
│   │   ├── Mock.swift
│   │   ├── Post.swift
│   │   └── User.swift
│   ├── Presentation
│   │   ├── Community
│   │   │   ├── Storyboard
│   │   │   │   └── Community.storyboard
│   │   │   └── ViewController
│   │   │       └── CommunityViewController.swift
│   │   ├── Detail
│   │   │   ├── Storyboard
│   │   │   │   └── Detail.storyboard
│   │   │   └── ViewController
│   │   │       └── DetailViewController.swift
│   │   ├── Edit
│   │   │   ├── Storyboard
│   │   │   │   └── Edit.storyboard
│   │   │   └── ViewController
│   │   │       └── EditViewController.swift
│   │   ├── History
│   │   │   ├── Storyboard
│   │   │   │   └── History.storyboard
│   │   │   └── ViewController
│   │   │       └── HistoryViewController.swift
│   │   ├── Home
│   │   │   ├── Storyboard
│   │   │   │   └── Home.storyboard
│   │   │   └── ViewController
│   │   │       └── HomeViewController.swift
│   │   ├── Main
│   │   │   └── Storyboard
│   │   │       └── Main.storyboard
│   │   ├── Profile
│   │   │   ├── Storyboard
│   │   │   │   └── Profile.storyboard
│   │   │   └── ViewController
│   │   │       └── ProfileViewController.swift
│   │   └── Write
│   │       ├── Storyboard
│   │       │   └── Write.storyboard
│   │       └── ViewController
│   │           └── WriteViewController.swift
│   ├── Resource
│   │   ├── Assets.xcassets
│   │   │   ├── AppIcon.appiconset
│   │   │   ├── Contents.json
│   │   │   ├── Image
│   │   │   └── Palette
│   │   ├── Font
│   │   ├── Icon
│   │   ├── Image
│   │   └── LaunchScreen.storyboard
│   └── Utility
│       ├── ColorManager.swift
│       ├── DateTimeFormatter.swift
│       └── ExternalManager.swift
```
