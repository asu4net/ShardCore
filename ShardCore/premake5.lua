project "ShardCore"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"
    
    targetdir ("%{wks.location}/Binaries/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/Intermediate/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{wks.location}/%{prj.name}/Source/**.h",
        "%{wks.location}/%{prj.name}/Source/**.cpp"
    }

    includedirs
    {
        "%{wks.location}/%{prj.name}/Source"
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