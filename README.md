<p align="center">
    <a href="https://github.com/ComposeComponents/Serializable" rel="noopener">
        <img width=150px src="https://raw.githubusercontent.com/ComposeComponents/.github/main/logo_transparent.png" ></img>
    </a>
    <h1 align="center">Kotlin Multiplatform Serializable</h1>
    <p align="center">
        Use `Serialize` in your Kotlin Multiplatform Projects
    </p>
</p>

<div align="center">
    
[![Build](https://github.com/ComposeComponents/Serializable/actions/workflows/build-library.yml/badge.svg)](https://github.com/ComposeComponents/Serializable/actions/workflows/build-library.yml)
[![Lint](https://github.com/ComposeComponents/Serializable/actions/workflows/lint.yml/badge.svg)](https://github.com/ComposeComponents/Serializable/actions/workflows/lint.yml)

</div>

## Installation
![Stable](https://img.shields.io/github/v/release/ComposeComponents/Serializable?label=Stable)
![Preview](https://img.shields.io/github/v/release/ComposeComponents/Serializable?label=Preview&include_prereleases)

```kotlin
implementation("cl.emilym.kmp:serializable:<latest>")
```

## Usage

```kotlin
import cl.emilym.kmp.serializable.Serializable

data class Thing(
    val data: String
): Serializable
```
