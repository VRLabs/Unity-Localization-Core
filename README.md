Note: this fork goes against Dreadrith's, the Original Author, wishes. Is is however compliant with the original OS license.

<div align="center">

# Unity-Localization-Core

[![Generic badge](https://img.shields.io/github/downloads/VRLabs/Unity-Localiation-Core/total?label=Downloads)](https://github.com/VRLabs/Unity-Localiation-Core/releases/latest)
[![Generic badge](https://img.shields.io/badge/License-MIT-informational.svg)](https://github.com/VRLabs/Unity-Localiation-Core/blob/main/LICENSE)
[![Generic badge](https://img.shields.io/badge/Unity-2019.4.31f1-lightblue.svg)](https://unity3d.com/unity/whats-new/2019.4.31)
[![Generic badge](https://img.shields.io/badge/SDK-AvatarSDK3-lightblue.svg)](https://vrchat.com/home/download)

[![Generic badge](https://img.shields.io/discord/706913824607043605?color=%237289da&label=DISCORD&logo=Discord&style=for-the-badge)](https://discord.vrlabs.dev/)
[![Generic badge](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Fshieldsio-patreon.vercel.app%2Fapi%3Fusername%3Dvrlabs%26type%3Dpatrons&style=for-the-badge)](https://patreon.vrlabs.dev/)

A framework allowing for easy Localization of scripts in Unity.

[TODO ADD GIF]

### ⬇️ [Download Latest Version](https://github.com/VRLabs/Unity-Localization-Core/releases/latest)

### 📦 [Add to VRChat Creator Companion](https://vrlabs.dev/packages?package=dev.vrlabs.unity-localiation-core)

</div>

---

## What it does

Unity-Localization-Core is framework for Unity script localization. It comes with a handy UI and clean interface for localization.  

It can be used in two ways:
- Bundled with your script
- As a dependency

To allow for a nice overview during translation, you can use the [Unity-Localization-Inspector](https://www.github.com/VRLabs/Unity-Localization-Inspector) package.

## Features

- Single method call to create a language selection dropdown
- Localization keys as enum values, so you'll never misspell them
- Language setting saved across projects

## How to use

### Bundling
There are two options here, either:

As a dependency:
- Add this package as a VPM dependency/UnityPackage Dependency
- Add a reference to the VRLabs.Unity-Localization-Core.Editor assembly definition

or bundled:
- Copy this entire package into your code
- Regenerate all the GUIDs, probably using some sort of tool
- Rename the Assembly Definition file and name
- Add a reference to this new assembly definition to your own assembly definition

### Code

To start off, create a class that inherits from LocalizationScriptableBase, with a title in the "hostTitle" field.

```csharp
public class AV3ManagerLocalization : LocalizationScriptableBase
{
    public override string hostTitle => "Avatar 3.0 Manager Localization";
}
```

Then, create an enum containing the values you want for every category (for now we'll only do one).

```csharp
public class AV3ManagerLocalization : LocalizationScriptableBase
{
    public override string hostTitle => "Avatar 3.0 Manager Localization";

    public enum Keys
    {
        Merger_AnimatorMode,
        Merger_Animator,
        Merger_Parameters,
        Merger_Suffix,
        Merger_SelfMergeWarning,
        ...
    }
}
```

Afterwards, return a list of KeyCollections with their names and values for the keyCollections property.

```csharp
public class AV3ManagerLocalization : LocalizationScriptableBase
{
    public override string hostTitle => "Avatar 3.0 Manager Localization";

    public override KeyCollection[] keyCollections => new[] { new KeyCollection("Avatar 3.0 Manager Localization", typeof(Keys)) };
    
    public enum Keys
    {
        Merger_AnimatorMode,
        Merger_Animator,
        Merger_Parameters,
        Merger_Suffix,
        Merger_SelfMergeWarning,
        ...
    }
}
```

Now, you can use it in the code (here the class is instantiated as a singleton, but you can do this however you want):

```csharp
        private static LocalizationHandler<AV3ManagerLocalization> _localizationHandler;
        public static LocalizationHandler<AV3ManagerLocalization> LocalizationHandler
        {
            get
            {
                if (_localizationHandler == null)
                    _localizationHandler = new LocalizationHandler<AV3ManagerLocalization>();
                return _localizationHandler;
            }
        }
        
        ...
            
        public void OnGui()
        {
            EditorGUILayout.Label(LocalizationHandler.Get(Merger_AnimatorMode).text);    
        }
```

Now to let the user choose their own language, you can call `LocalizationHandler.DrawField()` on your LocalizationHandler, and the dropdown will be drawn for you.

### Initial Language Setup

For this part, you have to use [Unity-Localization-Inspector](https://www.github.com/VRLabs/Unity-Localization-Inspector) package.

- Create a new Localization file by right-clicking the Assets window and clicking Create -> DreadScripts -> Localization File.
- Select your Class in the list of Classes to Translate.
  - If you don't see your class show up and you are using the Bundled option, you can temporarily change your Assembly Definition to point to the VRLabs install of Unity-Localization-Core, not your own, as Unity-Localization-Inspector only works with the default install.
- Fill in the language name (in that language, so e.g. Dutch becomes Nederlands, etc.) and start filling in values.

## License

Unity-Localization-Core is available as-is under MIT. For more information see [LICENSE](https://github.com/VRLabs/Unity-Localization-Core/blob/main/LICENSE).

​

<div align="center">

[<img src="https://github.com/VRLabs/Resources/raw/main/Icons/VRLabs.png" width="50" height="50">](https://vrlabs.dev "VRLabs")
<img src="https://github.com/VRLabs/Resources/raw/main/Icons/Empty.png" width="10">
[<img src="https://github.com/VRLabs/Resources/raw/main/Icons/Discord.png" width="50" height="50">](https://discord.vrlabs.dev/ "VRLabs")
<img src="https://github.com/VRLabs/Resources/raw/main/Icons/Empty.png" width="10">
[<img src="https://github.com/VRLabs/Resources/raw/main/Icons/Patreon.png" width="50" height="50">](https://patreon.vrlabs.dev/ "VRLabs")
<img src="https://github.com/VRLabs/Resources/raw/main/Icons/Empty.png" width="10">
[<img src="https://github.com/VRLabs/Resources/raw/main/Icons/Twitter.png" width="50" height="50">](https://twitter.com/vrlabsdev "VRLabs")

</div>

