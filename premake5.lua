workspace "ShardCore"
    architecture "x86_64"
    startproject "ShardCore-Examples"
    
    configurations
    {
        "Debug",
        "Release"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "ShardCore"
    location "ShardCore"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"
    
    targetdir ("Binaries/" .. outputdir .. "/%{prj.name}")
    objdir ("Intermediate/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/Source/**.h",
        "%{prj.name}/Source/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/Source"
    }

    filter "system:windows"
        systemversion "latest"
    
    filter "configurations:Debug"
        defines "SH_DEBUG"
        runtime "Debug"
        symbols "on"
    
    filter "configurations:Release"
        defines "SH_RELEASE"
        runtime "Release"
        optimize "on"

project "ShardCore-Examples"
    location "ShardCore-Examples"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"

    targetdir ("Binaries/" .. outputdir .. "/%{prj.name}")
    objdir ("Intermediate/" .. outputdir .. "/%{prj.name}")
    
    files
    {
        "%{prj.name}/Source/**.h",
        "%{prj.name}/Source/**.cpp"
    }
    
    includedirs
    {
        "%{prj.name}/Source",
        "ShardCore/Source"
    }

    links
    {
        "ShardCore"
    }
    
    filter "system:windows"
        systemversion "latest"
    
    filter "configurations:Debug"
        defines "SH_DEBUG"
        runtime "Debug"
        symbols "on"
    
    filter "configurations:Release"
        defines "SH_RELEASE"
        runtime "Release"
        optimize "on"