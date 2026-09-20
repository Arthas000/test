-- Arcade-Alpha User Script Reference (v1.11.3)

--- @enum Ease
Ease = {
  Unset = 0,
  Linear = 1,
  InSine = 2,
  OutSine = 3,
  InOutSine = 4,
  InQuad = 5,
  OutQuad = 6,
  InOutQuad = 7,
  InCubic = 8,
  OutCubic = 9,
  InOutCubic = 10,
  InQuart = 11,
  OutQuart = 12,
  InOutQuart = 13,
  InQuint = 14,
  OutQuint = 15,
  InOutQuint = 16,
  InExpo = 17,
  OutExpo = 18,
  InOutExpo = 19,
  InCirc = 20,
  OutCirc = 21,
  InOutCirc = 22,
  InElastic = 23,
  OutElastic = 24,
  InOutElastic = 25,
  InBack = 26,
  OutBack = 27,
  InOutBack = 28,
  InBounce = 29,
  OutBounce = 30,
  InOutBounce = 31,
  Flash = 32,
  InFlash = 33,
  OutFlash = 34,
  InOutFlash = 35,
  INTERNAL_Zero = 36,
  INTERNAL_Custom = 37,
}

--- @enum BlendMode
BlendMode = {
  Zero = 0,
  One = 1,
  DstColor = 2,
  SrcColor = 3,
  OneMinusDstColor = 4,
  SrcAlpha = 5,
  OneMinusSrcColor = 6,
  DstAlpha = 7,
  OneMinusDstAlpha = 8,
  SrcAlphaSaturate = 9,
  OneMinusSrcAlpha = 10,
}

--- @param src BlendMode
--- @param dst BlendMode
function BlendModeGroup.Assign(src, dst) end

--- @param other BlendModeGroup
--- @return boolean
function BlendModeGroup.Equals(other) end

--- @return integer
function BlendModeGroup.GetHashCode() end

--- @class BlendModeGroup
--- @field public Src BlendMode
--- @field public Dst BlendMode
--- public get<br>public set
--- @field public Item BlendMode
BlendModeGroup = {}


function ColorGradingCurve.Cache() end

--- @param t number
--- @return number
function ColorGradingCurve.Evaluate(t) end

--- @class ColorGradingCurve
--- public get<br>public set
--- @field public Curve AnimationCurve
ColorGradingCurve = {}


--- @return string
function Color.ToString() end

--- @static<br/>
--- Linearly interpolates between two colors (RGBA)
--- @param colorA Color Start color
--- @param colorB Color End color
--- @param t number Interpolation factor (0~1)
--- @return Color
function Color.Lerp(colorA, colorB, t) end

--- @static<br/>
--- Converts RGB to HSV
--- @param r number Red channel (0~1)
--- @param g number Green channel (0~1)
--- @param b number Blue channel (0~1)
--- @return Vec4
function Color.RGBToHSV(r, g, b) end

--- @static<br/>
--- Converts HSV to RGB
--- @param h number Hue (0~1)
--- @param s number Saturation (0~1)
--- @param v number Value (0~1)
--- @return Color
function Color.HSVToRGB(h, s, v) end

--- @static<br/>
--- Converts RGB to HSV (preserves alpha)
--- @param color Color Input color
--- @return Vec4
function Color.RGBToHSV(color) end

--- @static<br/>
--- Converts HSV to RGB (with alpha)
--- @param hsv Vec4 HSV vector (H, S, V, A)
--- @return Color
function Color.HSVToRGB(hsv) end

--- @class Color
--- @field public R number
--- @field public G number
--- @field public B number
--- @field public A number
Color = {}


--- @return Vec2
function Data.Vec2() end

--- @param x number
--- @param y number
--- @return Vec2
function Data.Vec2(x, y) end

--- @return Vec3
function Data.Vec3() end

--- @param x number
--- @param y number
--- @param z number
--- @return Vec3
function Data.Vec3(x, y, z) end

--- @return Vec4
function Data.Vec4() end

--- @param x number
--- @param y number
--- @param z number
--- @param w number
--- @return Vec4
function Data.Vec4(x, y, z, w) end

--- @return Color
function Data.Color() end

--- 0xRRGGBBAA
--- @param color integer
--- @return Color
function Data.Color(color) end

--- 0xRRGGBB
--- @param color integer
--- @return Color
function Data.ColorI(color) end

--- @param r integer
--- @param g integer
--- @param b integer
--- @return Color
function Data.Color32(r, g, b) end

--- @param r integer
--- @param g integer
--- @param b integer
--- @param a integer
--- @return Color
function Data.Color32(r, g, b, a) end

--- @param r number
--- @param g number
--- @param b number
--- @return Color
function Data.Color(r, g, b) end

--- @param r number
--- @param g number
--- @param b number
--- @param a number
--- @return Color
function Data.Color(r, g, b, a) end

--- @return TexParams
function Data.CreateTexParams() end

--- @enum TextureWrapMode
TextureWrapMode = {
  Repeat = 0,
  Clamp = 1,
  Mirror = 2,
  MirrorOnce = 3,
}

--- @enum FilterMode
FilterMode = {
  Point = 0,
  Bilinear = 1,
  Trilinear = 2,
}

--- @param wrapModeU TextureWrapMode
--- @param wrapModeV TextureWrapMode
--- @param wrapModeW TextureWrapMode
--- @param filterMode FilterMode
--- @return TexParams
function Data.CreateTexParams(wrapModeU, wrapModeV, wrapModeW, filterMode) end

--- @return Material
function Data.Material() end

--- @param shaderName string
--- @return Material
function Data.Material(shaderName) end

--- @return Keyframe
function Data.Keyframe() end

--- @param time number
--- @param value number
--- @return Keyframe
function Data.Keyframe(time, value) end

--- @param time number
--- @param value number
--- @param inTangent number
--- @param outTangent number
--- @return Keyframe
function Data.Keyframe(time, value, inTangent, outTangent) end

--- @param time number
--- @param value number
--- @param inTangent number
--- @param outTangent number
--- @param inWeight number
--- @param outWeight number
--- @return Keyframe
function Data.Keyframe(time, value, inTangent, outTangent, inWeight, outWeight) end

--- @param filePath string
--- @param markNonReadable boolean
--- @param mipChain boolean
--- @return Texture2D
function Data.Texture2D(filePath, markNonReadable, mipChain) end

--- @param filePath string
--- @param markNonReadable boolean
--- @param mipChain boolean
--- @param texParams TexParams
--- @return Texture2D
function Data.Texture2D(filePath, markNonReadable, mipChain, texParams) end

--- @param filePath string
--- @return Texture2D
function Data.Texture2D(filePath) end

--- @param filePath string
--- @param markNonReadable boolean
--- @return Texture2D
function Data.Texture2D(filePath, markNonReadable) end

--- @param mipChain boolean
--- @param filePath string
--- @return Texture2D
function Data.Texture2D(mipChain, filePath) end

--- @enum TextureFormat
TextureFormat = {
  Alpha8 = 1,
  ARGB4444 = 2,
  RGB24 = 3,
  RGBA32 = 4,
  ARGB32 = 5,
  RGB565 = 7,
  R16 = 9,
  DXT1 = 10,
  DXT5 = 12,
  RGBA4444 = 13,
  BGRA32 = 14,
  RHalf = 15,
  RGHalf = 16,
  RGBAHalf = 17,
  RFloat = 18,
  RGFloat = 19,
  RGBAFloat = 20,
  YUY2 = 21,
  RGB9e5Float = 22,
  BC4 = 26,
  BC5 = 27,
  BC6H = 24,
  BC7 = 25,
  DXT1Crunched = 28,
  DXT5Crunched = 29,
  PVRTC_RGB2 = 30,
  PVRTC_RGBA2 = 31,
  PVRTC_RGB4 = 32,
  PVRTC_RGBA4 = 33,
  ETC_RGB4 = 34,
  EAC_R = 41,
  EAC_R_SIGNED = 42,
  EAC_RG = 43,
  EAC_RG_SIGNED = 44,
  ETC2_RGB = 45,
  ETC2_RGBA1 = 46,
  ETC2_RGBA8 = 47,
  ASTC_4x4 = 48,
  ASTC_5x5 = 49,
  ASTC_6x6 = 50,
  ASTC_8x8 = 51,
  ASTC_10x10 = 52,
  ASTC_12x12 = 53,
  ETC_RGB4_3DS = 60,
  ETC_RGBA8_3DS = 61,
  RG16 = 62,
  R8 = 63,
  ETC_RGB4Crunched = 64,
  ETC2_RGBA8Crunched = 65,
  ASTC_HDR_4x4 = 66,
  ASTC_HDR_5x5 = 67,
  ASTC_HDR_6x6 = 68,
  ASTC_HDR_8x8 = 69,
  ASTC_HDR_10x10 = 70,
  ASTC_HDR_12x12 = 71,
  ASTC_RGB_4x4 = 48,
  ASTC_RGB_5x5 = 49,
  ASTC_RGB_6x6 = 50,
  ASTC_RGB_8x8 = 51,
  ASTC_RGB_10x10 = 52,
  ASTC_RGB_12x12 = 53,
  ASTC_RGBA_4x4 = 54,
  ASTC_RGBA_5x5 = 55,
  ASTC_RGBA_6x6 = 56,
  ASTC_RGBA_8x8 = 57,
  ASTC_RGBA_10x10 = 58,
  ASTC_RGBA_12x12 = 59,
}

--- @param width integer
--- @param height integer
--- @param textureFormat TextureFormat
--- @param mipCount integer
--- @param linear boolean
--- @return Texture2D
function Data.Texture2D(width, height, textureFormat, mipCount, linear) end

--- @param width integer
--- @param height integer
--- @return Texture2D
function Data.Texture2D(width, height) end

--- @param width integer
--- @param height integer
--- @param textureFormat TextureFormat
--- @return Texture2D
function Data.Texture2D(width, height, textureFormat) end

--- @param curve AnimationCurve
--- @param zeroValue number
--- @param loop boolean
--- @param bounds Vec2
--- @return ColorGradingCurve
function Data.ColorGradingCurve(curve, zeroValue, loop, bounds) end

--- @return LuaPostProcessingProfile
function Data.CreatePostProcessingProfile() end

--- @param keyframes any
--- @return AnimationCurve
function Data.AnimationCurve(keyframes) end

--- @class Data
--- public get
--- @field public Matrix4x4 Matrix4x4API
Data = {}


--- @return boolean
function Matrix4x4.ValidTRS() end

--- @param row integer
--- @param column integer
--- @return number
function Matrix4x4.Get(row, column) end

--- @param row integer
--- @param column integer
--- @param value number
function Matrix4x4.Set(row, column, value) end

--- @param index integer
--- @return number
function Matrix4x4.GetIndex(index) end

--- @param index integer
--- @param value number
function Matrix4x4.SetIndex(index, value) end

--- @param pos Vec3
--- @param q Vec3
--- @param s Vec3
function Matrix4x4.SetTRS(pos, q, s) end

--- @return string
function Matrix4x4.ToString() end

--- @class Matrix4x4
--- public get<br>public set
--- @field public M00 number
--- public get<br>public set
--- @field public M01 number
--- public get<br>public set
--- @field public M02 number
--- public get<br>public set
--- @field public M03 number
--- public get<br>public set
--- @field public M10 number
--- public get<br>public set
--- @field public M11 number
--- public get<br>public set
--- @field public M12 number
--- public get<br>public set
--- @field public M13 number
--- public get<br>public set
--- @field public M20 number
--- public get<br>public set
--- @field public M21 number
--- public get<br>public set
--- @field public M22 number
--- public get<br>public set
--- @field public M23 number
--- public get<br>public set
--- @field public M30 number
--- public get<br>public set
--- @field public M31 number
--- public get<br>public set
--- @field public M32 number
--- public get<br>public set
--- @field public M33 number
--- public get
--- @field public Rotation Vec3
--- public get
--- @field public LossyScale Vec3
--- public get
--- @field public IsIdentity boolean
--- public get
--- @field public Determinant number
--- public get
--- @field public Inverse Matrix4x4
--- public get
--- @field public Transpose Matrix4x4
Matrix4x4 = {}


--- @enum GraphicsFormat
GraphicsFormat = {
  None = 0,
  R8_SRGB = 1,
  R8G8_SRGB = 2,
  R8G8B8_SRGB = 3,
  R8G8B8A8_SRGB = 4,
  R8_UNorm = 5,
  R8G8_UNorm = 6,
  R8G8B8_UNorm = 7,
  R8G8B8A8_UNorm = 8,
  R8_SNorm = 9,
  R8G8_SNorm = 10,
  R8G8B8_SNorm = 11,
  R8G8B8A8_SNorm = 12,
  R8_UInt = 13,
  R8G8_UInt = 14,
  R8G8B8_UInt = 15,
  R8G8B8A8_UInt = 16,
  R8_SInt = 17,
  R8G8_SInt = 18,
  R8G8B8_SInt = 19,
  R8G8B8A8_SInt = 20,
  R16_UNorm = 21,
  R16G16_UNorm = 22,
  R16G16B16_UNorm = 23,
  R16G16B16A16_UNorm = 24,
  R16_SNorm = 25,
  R16G16_SNorm = 26,
  R16G16B16_SNorm = 27,
  R16G16B16A16_SNorm = 28,
  R16_UInt = 29,
  R16G16_UInt = 30,
  R16G16B16_UInt = 31,
  R16G16B16A16_UInt = 32,
  R16_SInt = 33,
  R16G16_SInt = 34,
  R16G16B16_SInt = 35,
  R16G16B16A16_SInt = 36,
  R32_UInt = 37,
  R32G32_UInt = 38,
  R32G32B32_UInt = 39,
  R32G32B32A32_UInt = 40,
  R32_SInt = 41,
  R32G32_SInt = 42,
  R32G32B32_SInt = 43,
  R32G32B32A32_SInt = 44,
  R16_SFloat = 45,
  R16G16_SFloat = 46,
  R16G16B16_SFloat = 47,
  R16G16B16A16_SFloat = 48,
  R32_SFloat = 49,
  R32G32_SFloat = 50,
  R32G32B32_SFloat = 51,
  R32G32B32A32_SFloat = 52,
  B8G8R8_SRGB = 56,
  B8G8R8A8_SRGB = 57,
  B8G8R8_UNorm = 58,
  B8G8R8A8_UNorm = 59,
  B8G8R8_SNorm = 60,
  B8G8R8A8_SNorm = 61,
  B8G8R8_UInt = 62,
  B8G8R8A8_UInt = 63,
  B8G8R8_SInt = 64,
  B8G8R8A8_SInt = 65,
  R4G4B4A4_UNormPack16 = 66,
  B4G4R4A4_UNormPack16 = 67,
  R5G6B5_UNormPack16 = 68,
  B5G6R5_UNormPack16 = 69,
  R5G5B5A1_UNormPack16 = 70,
  B5G5R5A1_UNormPack16 = 71,
  A1R5G5B5_UNormPack16 = 72,
  E5B9G9R9_UFloatPack32 = 73,
  B10G11R11_UFloatPack32 = 74,
  A2B10G10R10_UNormPack32 = 75,
  A2B10G10R10_UIntPack32 = 76,
  A2B10G10R10_SIntPack32 = 77,
  A2R10G10B10_UNormPack32 = 78,
  A2R10G10B10_UIntPack32 = 79,
  A2R10G10B10_SIntPack32 = 80,
  A2R10G10B10_XRSRGBPack32 = 81,
  A2R10G10B10_XRUNormPack32 = 82,
  R10G10B10_XRSRGBPack32 = 83,
  R10G10B10_XRUNormPack32 = 84,
  A10R10G10B10_XRSRGBPack32 = 85,
  A10R10G10B10_XRUNormPack32 = 86,
  RGB_DXT1_SRGB = 96,
  RGBA_DXT1_SRGB = 96,
  RGB_DXT1_UNorm = 97,
  RGBA_DXT1_UNorm = 97,
  RGBA_DXT3_SRGB = 98,
  RGBA_DXT3_UNorm = 99,
  RGBA_DXT5_SRGB = 100,
  RGBA_DXT5_UNorm = 101,
  R_BC4_UNorm = 102,
  R_BC4_SNorm = 103,
  RG_BC5_UNorm = 104,
  RG_BC5_SNorm = 105,
  RGB_BC6H_UFloat = 106,
  RGB_BC6H_SFloat = 107,
  RGBA_BC7_SRGB = 108,
  RGBA_BC7_UNorm = 109,
  RGB_PVRTC_2Bpp_SRGB = 110,
  RGB_PVRTC_2Bpp_UNorm = 111,
  RGB_PVRTC_4Bpp_SRGB = 112,
  RGB_PVRTC_4Bpp_UNorm = 113,
  RGBA_PVRTC_2Bpp_SRGB = 114,
  RGBA_PVRTC_2Bpp_UNorm = 115,
  RGBA_PVRTC_4Bpp_SRGB = 116,
  RGBA_PVRTC_4Bpp_UNorm = 117,
  RGB_ETC_UNorm = 118,
  RGB_ETC2_SRGB = 119,
  RGB_ETC2_UNorm = 120,
  RGB_A1_ETC2_SRGB = 121,
  RGB_A1_ETC2_UNorm = 122,
  RGBA_ETC2_SRGB = 123,
  RGBA_ETC2_UNorm = 124,
  R_EAC_UNorm = 125,
  R_EAC_SNorm = 126,
  RG_EAC_UNorm = 127,
  RG_EAC_SNorm = 128,
  RGBA_ASTC4X4_SRGB = 129,
  RGBA_ASTC4X4_UNorm = 130,
  RGBA_ASTC5X5_SRGB = 131,
  RGBA_ASTC5X5_UNorm = 132,
  RGBA_ASTC6X6_SRGB = 133,
  RGBA_ASTC6X6_UNorm = 134,
  RGBA_ASTC8X8_SRGB = 135,
  RGBA_ASTC8X8_UNorm = 136,
  RGBA_ASTC10X10_SRGB = 137,
  RGBA_ASTC10X10_UNorm = 138,
  RGBA_ASTC12X12_SRGB = 139,
  RGBA_ASTC12X12_UNorm = 140,
}

--- @enum TextureDimension
TextureDimension = {
  Unknown = -1,
  None = 0,
  Any = 1,
  Tex2D = 2,
  Tex3D = 3,
  Cube = 4,
  Tex2DArray = 5,
  CubeArray = 6,
}

--- @return IntPtr
function Texture.GetNativeTexturePtr() end

function Texture.IncrementUpdateCount() end

--- @class Texture
--- public get
--- @field public MipmapCount integer
--- public get
--- @field public graphicsFormat GraphicsFormat
--- public get<br>public set
--- @field public Width integer
--- public get<br>public set
--- @field public Height integer
--- public get<br>public set
--- @field public Dimension TextureDimension
--- public get
--- @field public IsReadable boolean
--- public get<br>public set
--- @field public WrapMode TextureWrapMode
--- public get<br>public set
--- @field public WrapModeU TextureWrapMode
--- public get<br>public set
--- @field public WrapModeV TextureWrapMode
--- public get<br>public set
--- @field public WrapModeW TextureWrapMode
--- public get<br>public set
--- @field public FilterMode FilterMode
--- public get<br>public set
--- @field public AnisoLevel integer
--- public get<br>public set
--- @field public MipMapBias number
--- public get
--- @field public TexelSize Vec2
--- public get
--- @field public UpdateCount integer
Texture = {}


--- @return IntPtr
function Texture2D.GetNativeTexturePtr() end

function Texture2D.IncrementUpdateCount() end

--- @param highQuality boolean
function Texture2D.Compress(highQuality) end

--- @return boolean
function Texture2D.IsRequestedMipmapLevelLoaded() end

function Texture2D.ClearMinimumMipmapLevel() end

--- @class Array
--- public get
--- @field public LongLength integer
--- public get
--- @field public IsFixedSize boolean
--- public get
--- @field public IsReadOnly boolean
--- public get
--- @field public IsSynchronized boolean
--- public get
--- @field public SyncRoot Object
--- public get
--- @field public Length integer
--- public get
--- @field public Rank integer
Array = {}


--- @return Array<integer>
function Texture2D.GetRawTextureData() end

--- @return Array<Color>
function Texture2D.GetPixels() end

--- @param x integer
--- @param y integer
--- @param blockWidth integer
--- @param blockHeight integer
--- @param miplevel integer
--- @return Array<Color>
function Texture2D.GetPixels(x, y, blockWidth, blockHeight, miplevel) end

--- @param x integer
--- @param y integer
--- @param blockWidth integer
--- @param blockHeight integer
--- @return Array<Color>
function Texture2D.GetPixels(x, y, blockWidth, blockHeight) end

--- @param x integer
--- @param y integer
--- @param color Color
function Texture2D.SetPixel(x, y, color) end

--- @param x integer
--- @param y integer
--- @param color Color
--- @param miplevel integer
function Texture2D.SetPixel(x, y, color, miplevel) end

--- @class Texture2D
--- public get
--- @field public MipmapCount integer
--- public get
--- @field public graphicsFormat GraphicsFormat
--- public get<br>public set
--- @field public Width integer
--- public get<br>public set
--- @field public Height integer
--- public get<br>public set
--- @field public Dimension TextureDimension
--- public get
--- @field public IsReadable boolean
--- public get<br>public set
--- @field public WrapMode TextureWrapMode
--- public get<br>public set
--- @field public WrapModeU TextureWrapMode
--- public get<br>public set
--- @field public WrapModeV TextureWrapMode
--- public get<br>public set
--- @field public WrapModeW TextureWrapMode
--- public get<br>public set
--- @field public FilterMode FilterMode
--- public get<br>public set
--- @field public AnisoLevel integer
--- public get<br>public set
--- @field public MipMapBias number
--- public get
--- @field public TexelSize Vec2
--- public get
--- @field public UpdateCount integer
--- public get
--- @field public Format TextureFormat
--- public get
--- @field public StreamingMipmaps boolean
--- public get
--- @field public StreamingMipmapsPriority integer
--- public get<br>public set
--- @field public RequestedMipmapLevel integer
--- public get<br>public set
--- @field public MinimumMipmapLevel integer
--- public get
--- @field public CalculatedMipmapLevel integer
--- public get
--- @field public DesiredMipmapLevel integer
--- public get
--- @field public LoadingMipmapLevel integer
--- public get
--- @field public LoadedMipmapLevel integer
Texture2D = {}


--- @return string
function Vec2Int.ToString() end

--- @class Vec2Int
--- @field public X integer
--- @field public Y integer
--- public get<br>public set
--- @field public x integer
--- public get<br>public set
--- @field public y integer
Vec2Int = {}


--- @return string
function Vec2.ToString() end

--- @class Vec2
--- @field public X number
--- @field public Y number
--- public get<br>public set
--- @field public x number
--- public get<br>public set
--- @field public y number
Vec2 = {}


--- @static<br/>
--- @param a Vec3
--- @param b Vec3
--- @param t number
--- @return Vec3
function Vec3.Lerp(a, b, t) end

--- @static<br/>
--- @param a Vec3
--- @return number
function Vec3.Magnitude(a) end

--- @static<br/>
--- @param a Vec3
--- @return number
function Vec3.SqrMagnitude(a) end

--- @static<br/>
--- @param a Vec3
--- @param b Vec3
--- @return number
function Vec3.Dot(a, b) end

--- @static<br/>
--- @param a Vec3
--- @param b Vec3
--- @return number
function Vec3.Distance(a, b) end

--- @static<br/>
--- @param a Vec3
--- @return Vec3
function Vec3.Normalize(a) end

--- @static<br/>
--- @param a Vec3
--- @param b Vec3
--- @return Vec3
function Vec3.Cross(a, b) end

--- @return string
function Vec3.ToString() end

--- @class Vec3
--- @field public X number
--- @field public Y number
--- @field public Z number
--- public get<br>public set
--- @field public x number
--- public get<br>public set
--- @field public y number
--- public get<br>public set
--- @field public z number
--- public get
--- @field public Zero Vec3
--- public get
--- @field public One Vec3
--- public get
--- @field public Up Vec3
--- public get
--- @field public Down Vec3
--- public get
--- @field public Right Vec3
--- public get
--- @field public Left Vec3
--- public get
--- @field public Forward Vec3
--- public get
--- @field public Back Vec3
Vec3 = {}


--- @static<br/>
--- @param a Vec4
--- @param b Vec4
--- @param t number
--- @return Vec4
function Vec4.Lerp(a, b, t) end

--- @static<br/>
--- @param a Vec4
--- @return number
function Vec4.Magnitude(a) end

--- @static<br/>
--- @param a Vec4
--- @return number
function Vec4.SqrMagnitude(a) end

--- @static<br/>
--- @param a Vec4
--- @param b Vec4
--- @return number
function Vec4.Dot(a, b) end

--- @static<br/>
--- @param a Vec4
--- @param b Vec4
--- @return number
function Vec4.Distance(a, b) end

--- @static<br/>
--- @param a Vec4
--- @return Vec4
function Vec4.Normalize(a) end

--- @return string
function Vec4.ToString() end

--- @class Vec4
--- @field public X number
--- @field public Y number
--- @field public Z number
--- @field public W number
--- public get<br>public set
--- @field public x number
--- public get<br>public set
--- @field public y number
--- public get<br>public set
--- @field public z number
--- public get<br>public set
--- @field public w number
--- public get
--- @field public Zero Vec4
--- public get
--- @field public One Vec4
Vec4 = {}


--- @param time number
--- @param value number
function AnimationCurve.AddKey(time, value) end

--- @param key Keyframe
function AnimationCurve.AddKey(key) end

--- @param index integer
function AnimationCurve.RemoveKey(index) end

--- @param index integer
--- @param key Keyframe
function AnimationCurve.MoveKey(index, key) end

--- @param index integer
--- @param weight number
function AnimationCurve.SmoothTangents(index, weight) end

--- @param time number
--- @return number
function AnimationCurve.Evaluate(time) end

--- @class AnimationCurve
--- public get<br>public set
--- @field public Keys Array<Keyframe>
AnimationCurve = {}


--- @class GradientColorKey
--- @field public Color Color
--- @field public Time number
GradientColorKey = {}


--- @class GradientAlphaKey
--- @field public Alpha number
--- @field public Time number
GradientAlphaKey = {}


--- @enum GradientMode
GradientMode = {
  Blend = 0,
  Fixed = 1,
}

--- @param time number
--- @return Color
function Gradient.Evaluate(time) end

--- @param colorKeys Array<GradientColorKey>
--- @param alphaKeys Array<GradientAlphaKey>
function Gradient.SetKeys(colorKeys, alphaKeys) end

--- @class Gradient
--- public get<br>public set
--- @field public ColorKeys Array<GradientColorKey>
--- public get<br>public set
--- @field public AlphaKeys Array<GradientAlphaKey>
--- public get<br>public set
--- @field public Mode GradientMode
Gradient = {}


--- @enum WeightedMode
WeightedMode = {
  None = 0,
  In = 1,
  Out = 2,
  Both = 3,
}

--- @class Keyframe
--- public get<br>public set
--- @field public Time number
--- public get<br>public set
--- @field public Value number
--- public get<br>public set
--- @field public InTangent number
--- public get<br>public set
--- @field public OutTangent number
--- public get<br>public set
--- @field public InWeight number
--- public get<br>public set
--- @field public OutWeight number
--- public get<br>public set
--- @field public WeightedMode WeightedMode
Keyframe = {}


--- @enum CullMode
CullMode = {
  Off = 0,
  Front = 1,
  Back = 2,
}

--- @param pass integer
function Material.SetPass(pass) end

--- @param src BlendMode
--- @param dst BlendMode
function Material.SetBlendMode(src, dst) end

--- @return Array<BlendMode>
function Material.GetBlendMode() end

--- @param mode CullMode
function Material.SetCullMode(mode) end

--- @param zWrite boolean
function Material.SetZWrite(zWrite) end

--- @param queue integer
function Material.SetRenderQueue(queue) end

--- @class Material
--- public get
--- @field public Name string
--- public get<br>public set
--- @field public CullMode CullMode
--- public get<br>public set
--- @field public ZWrite boolean
--- public get<br>public set
--- @field public RenderQueue integer
--- public get<br>public set
--- @field public UsePremultipliedAlpha boolean
--- public get<br>public set
--- @field public Color Color
--- public get
--- @field public Material Material
Material = {}


--- @enum ArgumentType
ArgumentType = {
  String = 0,
  Float = 1,
  Int = 2,
  Bool = 3,
  Timing = 4,
  List = 5,
}

--- @static<br/>
--- Register a external tool.<br/>
--- Example:
--- ```lua
--- Tool.Register(
---   "Tool name",
---   {
---     { "Timing", ArgumentType.Int },
---     { "Position", ArgumentType.Float },
---   },
---   function (timing, position)
---     -- do something
---     print(timing, position)
---   end
--- )
--- ```
--- @param name string
--- @param table table
--- @param _function function
function Tool.Register(name, table, _function) end

--- @static<br/>
--- Register a external tool with out name.<br/>
--- Example:
--- ```lua
--- Tool.Register(
---   {
---     { "Timing", ArgumentType.Int },
---     { "Position", ArgumentType.Float },
---   },
---   function (timing, position)
---     -- do something
---     print(timing, position)
---   end
--- )
--- ```
--- @param table table
--- @param _function function
function Tool.Register(table, _function) end

--- @static<br/>
--- Register a fast tool.<br/>
--- Example:
--- ```lua
--- Tool.Register(
---   "Name",
---   --- @param notes List<object>
---   function (notes)
---     for i = 0, notes.Count - 1, 1 do
---       local note = notes[i]
---     end
---   end
--- )
--- ```
--- @param name string
--- @param _function function
function Tool.Register(name, _function) end

--- @static<br/>
--- Register a fast tool with with editing task.<br/>
--- Example:
--- ```lua
--- local editing = NoteEditor.CreateEditing(
---   --- @param args List<object>
---   function (args)
---     local notes = args[0]
---     for i = 0, notes.Count - 1, 1 do
---       local note = notes[i]
---     end
---   end
--- )
--- Tool.Register(
---   "Name",
---   editing
--- )
--- ```
--- @param name string
--- @param editing AsyncEditing
function Tool.Register(name, editing) end

--- @class Tool
Tool = {}


--- Argument return type: int
--- @param argName string
function AsyncEditing.AddSelectTimingCommand(argName) end

--- Argument return type: Vec2
--- @param argName string
function AsyncEditing.AddSelectPositionCommand(argName) end

--- @class AsyncEditing
AsyncEditing = {}


--- @enum CameraClearFlags
CameraClearFlags = {
  Skybox = 1,
  Color = 2,
  SolidColor = 2,
  Depth = 3,
  Nothing = 4,
}

--- Transitions the camera projection from perspective to orthographic.
--- @param progress number
function Camera.ChangeProjection(progress) end

--- Projects a world position to screen space.
--- @param worldPos Vec3
--- @return Vec3
function Camera.Project(worldPos) end

--- Unprojects a screen position to world space.
--- @param screenPos Vec2
--- @return Vec3
function Camera.Unproject(screenPos) end

--- Projects a world position to screen space with canvas size.
--- @param worldPos Vec3
--- @return Vec3
function Camera.ProjectScaled(worldPos) end

--- Unprojects a screen position with canvas size back to world space.
--- @param screenPos Vec2
--- @return Vec3
function Camera.UnprojectScaled(screenPos) end

--- Projects a world position to screen space with canvas size.
--- @param worldPos Vec3
--- @param canvasSize Vec2
--- @return Vec3
function Camera.ProjectScaled(worldPos, canvasSize) end

--- Unprojects a screen position with canvas size back to world space.
--- @param screenPos Vec2
--- @param canvasSize Vec2
--- @return Vec3
function Camera.UnprojectScaled(screenPos, canvasSize) end

--- @class Camera
--- The field of view of the camera in degrees.<br>public get<br>public set
--- @field public FieldOfView number
--- The near clipping plane distance.<br>public get<br>public set
--- @field public NearClipPlane number
--- The far clipping plane distance.<br>public get<br>public set
--- @field public FarClipPlane number
--- Is the camera orthographic (true) or perspective (false)?<br>public get<br>public set
--- @field public Orthographic boolean
--- Set a custom projection matrix.<br>public get<br>public set
--- @field public ProjectionMatrix Matrix4x4
--- How the camera clears the background.<br>public get<br>public set
--- @field public ClearFlags CameraClearFlags
--- The color with which the screen will be cleared.<br>public get<br>public set
--- @field public BackgroundColor Color
--- The aspect ratio (width divided by height).<br>public get
--- @field public Aspect number
--- How wide is the camera in pixels (not accounting for dynamic resolution scaling) (Read Only).<br>public get
--- @field public PixelWidth integer
--- How tall is the camera in pixels (not accounting for dynamic resolution scaling) (Read Only).<br>public get
--- @field public PixelHeight integer
--- Get the field of view calculated based on the screen aspect ratio.<br>public get
--- @field public ResetFOV number
Camera = {}


--- @return number
function CharacterAbility.TempestHp() end

--- @return number
function CharacterAbility.CurrentHp() end

--- @class CharacterAbility
CharacterAbility = {}


--- @param table table
--- @return number
function CollectionAPI.Sum(table) end

--- @param table table
--- @return number
function CollectionAPI.Average(table) end

--- @class CollectionAPI
CollectionAPI = {}


--- @param str string
--- @return integer
function Convert.ToInt32(str) end

--- @param str string
--- @return number
function Convert.ToSingle(str) end

--- @class Convert
Convert = {}


--- @static<br/>
--- @param title string
--- @param content string
--- @param buttonContent string
function Dialog.Show(title, content, buttonContent) end

--- @static<br/>
--- @param title string
--- @param content string
--- @param leftContent string
--- @param rightContent string
function Dialog.ShowDual(title, content, leftContent, rightContent) end

--- @class Dialog
Dialog = {}


--- @static<br/>
--- @param ease Ease
--- @param progress number
--- @return number
function EaseManager.Evaluate(ease, progress) end

--- @static<br/>
--- @param ease any
--- @param progress number
--- @return number
function EaseManager.Evaluate(ease, progress) end

--- @static<br/>
--- @param easeFunc EaseFunction
--- @param progress number
--- @return number
function EaseManager.Evaluate(easeFunc, progress) end

--- @static<br/>
--- @param name ("Unset" | "Linear" | "InSine" | "OutSine" | "InOutSine" | "InQuad" | "OutQuad" | "InOutQuad" | "InCubic" | "OutCubic" | "InOutCubic" | "InQuart" | "OutQuart" | "InOutQuart" | "InQuint" | "OutQuint" | "InOutQuint" | "InExpo" | "OutExpo" | "InOutExpo" | "InCirc" | "OutCirc" | "InOutCirc" | "InElastic" | "OutElastic" | "InOutElastic" | "InBack" | "OutBack" | "InOutBack" | "InBounce" | "OutBounce" | "InOutBounce" | "Flash" | "InFlash" | "OutFlash" | "InOutFlash" | "INTERNAL_Zero" | "INTERNAL_Custom")
--- @return Ease
function EaseManager.ParseEase(name) end

--- @class List<T>
--- public get<br>public set
--- @field public Capacity integer
--- public get
--- @field public Count integer
--- public get<br>public set
--- @field public Item T
List = {}


--- @static<br/>
--- @return List<string>
function EaseManager.GetEaseNames() end

--- @class EaseManager
EaseManager = {}


--- @static<br/>
--- Reads all lines from a file
--- @param path string File path
--- @return Array<string>
function File.ReadLinesFromFile(path) end

--- @static<br/>
--- Reads all text from a file
--- @param path string File path
--- @return string
function File.ReadAllTextFromFile(path) end

--- @static<br/>
--- Writes text to a file (overwrites existing content)
--- @param path string File path
--- @param content string Text content
function File.WriteAllTextToFile(path, content) end

--- @static<br/>
--- Writes lines to a file (overwrites existing content)
--- @param path string File path
--- @param content table List of strings
function File.WriteAllLinesToFile(path, content) end

--- @static<br/>
--- Opens a file selection dialog and reads its text
--- @return string
function File.ReadAllTextFromSelectedFile() end

--- @class File
File = {}


--- Select events within the specified time range.
--- @param startTiming integer
--- @param endTiming integer
--- @return List<Object>
function GameplayManager.SelectEventsInRange(startTiming, endTiming) end

--- Get the opacity of the timing group for the specified group index (id).
--- @param groupID integer
--- @return number
function GameplayManager.GetGroupOpacity(groupID) end

--- Set the opacity of the timing group for the specified group index (id).
--- @param groupID integer
--- @param opacity number
function GameplayManager.SetGroupOpacity(groupID, opacity) end

--- Set the offset of game end time.
--- @param offset integer
function GameplayManager.SetEndOffset(offset) end

--- @enum GameResultType
GameResultType = {
  Fail = 0,
  Clear = 1,
  FullRecall = 2,
  PureMemory = 3,
}

--- Set the overridden game result type.
--- @param gameResultType GameResultType
function GameplayManager.SetOverrideGameResultType(gameResultType) end

--- Set whether the finish animation is hidden.
--- @param hidden boolean
function GameplayManager.SetClearFinishAnimationLayerHidden(hidden) end

--- Set the opacity of the Designant Arcs.
--- @param opacity number Range: 0.0 ~ 1.0
function GameplayManager.SetDesignantArcOpacity(opacity) end

--- Set the opacity of the Designant ArcTaps.
--- @param opacity number Range: 0.0 ~ 1.0
function GameplayManager.SetDesignantArcTapOpacity(opacity) end

--- Set the current visual effect to the effect for the specified difficulty (0 ~ 4 correspond to PST, PRS, FTR, BYD, ETR)
--- @param difficulty integer
function GameplayManager.SetDifficultyFeature(difficulty) end

--- @param key string
--- @param overrideBlendMode boolean
--- @param srcBlend BlendMode
--- @param dstBlend BlendMode
function GameplayManager.SetSinglelineSkin(key, overrideBlendMode, srcBlend, dstBlend) end

--- @param key string
function GameplayManager.SetTrackSkin(key) end

--- @param groupID integer
--- @param velocity number
function GameplayManager.SetGroupVelocity(groupID, velocity) end

--- @class GameplayManager
--- public get
--- @field public IsPlaying boolean
--- public get
--- @field public ChartTiming integer
--- public get
--- @field public CurrentDifficulty integer
--- public get
--- @field public CurrentSide integer
GameplayManager = {}


--- Calculate the position at the specified timing.
--- @param timing integer
--- @param groupID integer
--- @return number
function TimingManager.CalculatePosition(timing, groupID) end

--- Calculate the bpm at the specified timing.
--- @param timing integer
--- @param groupID integer
--- @return number
function TimingManager.CalculateBpm(timing, groupID) end

--- Calculate the position based on pivot timing and target timing.
--- @param pivotTiming integer
--- @param targetTiming integer
--- @param groupID integer
--- @return number
function TimingManager.CalculatePosition(pivotTiming, targetTiming, groupID) end

--- @param startTiming integer
--- @param endTiming integer
--- @param groupID integer
--- @return List<LuaTimingEvent>
function TimingManager.SelectTimingEventsInRange(startTiming, endTiming, groupID) end

--- @class TimingManager
--- public get
--- @field public CurrentTimingGroupID integer
--- public get
--- @field public TimingGroupCount integer
TimingManager = {}


--- Add audio to play at the specified time.
--- @param triggerTime integer
--- @param audioPath string Default directory is current script folder.
function AudioManager.AddScheduledAudio(triggerTime, audioPath) end

--- @class AudioManager
AudioManager = {}


--- @param shaderName string
function CustomPostProcessingController.ApplyShader(shaderName) end

--- @param name string
--- @param value integer
function CustomPostProcessingController.SetUniformInt(name, value) end

--- @param name string
--- @param value number
function CustomPostProcessingController.SetUniformFloat(name, value) end

--- @param name string
--- @param value Vec2
function CustomPostProcessingController.SetUniformVec2(name, value) end

--- @param name string
--- @param value Vec3
function CustomPostProcessingController.SetUniformVec3(name, value) end

--- @param name string
--- @param value Vec4
function CustomPostProcessingController.SetUniformVec4(name, value) end

--- @param name string
--- @param value Color
function CustomPostProcessingController.SetUniformColor(name, value) end

--- @param name string
--- @param textureFilePath string Default directory is current project folder.
--- @param texParams TexParams
function CustomPostProcessingController.SetUniformTexture(name, textureFilePath, texParams) end

--- @param name string
--- @param value boolean
function CustomPostProcessingController.SetKeywordEnabled(name, value) end

--- @param name string
--- @return integer
function CustomPostProcessingController.GetUniformInt(name) end

--- @param name string
--- @return number
function CustomPostProcessingController.GetUniformFloat(name) end

--- @param name string
--- @return Vec2
function CustomPostProcessingController.GetUniformVec2(name) end

--- @param name string
--- @return Vec3
function CustomPostProcessingController.GetUniformVec3(name) end

--- @param name string
--- @return Vec4
function CustomPostProcessingController.GetUniformVec4(name) end

--- @param name string
--- @return Color
function CustomPostProcessingController.GetUniformColor(name) end

--- @param name string
--- @return boolean
function CustomPostProcessingController.GetKeywordEnabled(name) end

--- @class CustomPostProcessingController
CustomPostProcessingController = {}


--- @param eulerAngles Vec3
--- @return Vec3
function MathUtil.EulerToForward(eulerAngles) end

--- @param forward Vec3
--- @return Vec3
function MathUtil.ForwardToEuler(forward) end

--- @param a number
--- @param b number
--- @param t number
--- @return number
function MathUtil.Lerp(a, b, t) end

--- @param a Vec2
--- @param b Vec2
--- @return number
function MathUtil.Distance(a, b) end

--- @param a Vec3
--- @param b Vec3
--- @return number
function MathUtil.Distance(a, b) end

--- @class MathUtil
MathUtil = {}


--- @static<br/>
--- @param fov number
--- @param aspect number
--- @param zNear number
--- @param zFar number
--- @return Matrix4x4
function Matrix4x4API.Perspective(fov, aspect, zNear, zFar) end

--- @static<br/>
--- @param left number
--- @param right number
--- @param bottom number
--- @param top number
--- @param zNear number
--- @param zFar number
--- @return Matrix4x4
function Matrix4x4API.Ortho(left, right, bottom, top, zNear, zFar) end

--- @static<br/>
--- @param from Vec3
--- @param to Vec3
--- @param up Vec3
--- @return Matrix4x4
function Matrix4x4API.LookAt(from, to, up) end

--- @static<br/>
--- @param left number
--- @param right number
--- @param bottom number
--- @param top number
--- @param zNear number
--- @param zFar number
--- @return Matrix4x4
function Matrix4x4API.Frustum(left, right, bottom, top, zNear, zFar) end

--- @static<br/>
--- @param pos Vec3
--- @param q Vec3
--- @param s Vec3
--- @return Matrix4x4
function Matrix4x4API.TRS(pos, q, s) end

--- @class ValueTuple<T>
--- @field public Item1 T1
--- @field public Item2 T2
ValueTuple = {}


--- @static<br/>
--- @param input Matrix4x4
--- @param reference Matrix4x4
--- @return ValueTuple<boolean, Matrix4x4>
function Matrix4x4API.Inverse3DAffine(input, reference) end

--- @class Matrix4x4API
Matrix4x4API = {}


--- Create a new timing group and select it.
function NoteEditor.CreateTimingGroup() end

function NoteEditor.SelectBaseGroup() end

function NoteEditor.SelectLastGroup() end

--- @param id integer
function NoteEditor.SelectTimingGroup(id) end

--- @return LuaTimingGroup
function NoteEditor.GetCurrentTimingGroup() end

--- @return LuaTimingGroup
function NoteEditor.GetBaseTimingGroup() end

--- @return LuaTimingGroup
function NoteEditor.GetLastTimingGroup() end

--- @param id integer
--- @return LuaTimingGroup
function NoteEditor.GetTimingGroup(id) end

--- Add a Timing Event.
--- @param timing integer
--- @param bpm number
--- @param beats number
--- @return LuaTimingEvent
function NoteEditor.AddTimingEvent(timing, bpm, beats) end

--- Add a Tap Note.
--- @param timing integer
--- @param track integer Track index (0~5)
--- @return LuaTapNote
function NoteEditor.AddTapNote(timing, track) end

--- Add a lane position Tap Note.
--- @param timing integer
--- @param lane number Lane position (normally 0.0~1.0)
--- @return LuaTapNote
function NoteEditor.AddTapNoteFloat(timing, lane) end

--- Add a Hold Note.
--- @param timing integer
--- @param endTiming integer
--- @param track integer Track index (0~5)
--- @return LuaHoldNote
function NoteEditor.AddHoldNote(timing, endTiming, track) end

--- Add a lane position Hold Note.
--- @param timing integer
--- @param endTiming integer
--- @param lane number Lane position (normally 0.0~1.0)
--- @return LuaHoldNote
function NoteEditor.AddHoldNoteFloat(timing, endTiming, lane) end

--- Add an Arc Note.
--- @param timing integer
--- @param endTiming integer
--- @param startX number
--- @param endX number
--- @param easing string
--- @param startY number
--- @param endY number
--- @param colorID integer
--- @param sfxName string
--- @param isTrace boolean
--- @return LuaArcNote
function NoteEditor.AddArcNote(timing, endTiming, startX, endX, easing, startY, endY, colorID, sfxName, isTrace) end

--- Add an Arc Note.
--- @param timing integer
--- @param endTiming integer
--- @param startX number
--- @param endX number
--- @param easing string
--- @param startY number
--- @param endY number
--- @param colorID integer
--- @param isTrace boolean
--- @return LuaArcNote
function NoteEditor.AddArcNote(timing, endTiming, startX, endX, easing, startY, endY, colorID, isTrace) end

--- @enum ArcLineType
ArcLineType = {
  S = 0,
  B = 1,
  Si = 2,
  So = 3,
  SiSi = 4,
  SiSo = 5,
  SoSi = 6,
  SoSo = 7,
}

--- Add an Arc Note.
--- @param timing integer
--- @param endTiming integer
--- @param startX number
--- @param endX number
--- @param easing ArcLineType
--- @param startY number
--- @param endY number
--- @param colorID integer
--- @param isTrace boolean
--- @return LuaArcNote
function NoteEditor.AddArcNote(timing, endTiming, startX, endX, easing, startY, endY, colorID, isTrace) end

--- Add a Single ArcTap Note (with Arc Note).
--- @param timing integer
--- @param x number
--- @param y number
--- @return LuaArcNote
function NoteEditor.AddSingleArcTapNote(timing, x, y) end

--- Add an Arc note with ArcTap Note list.
--- 
--- Example:
--- ```lua
--- -- { time, ... }
--- local arctaps = {
---   0, 1000
--- }
--- 
--- -- { { time, width }, ... }
--- local arctaps = {
---   { 0, 2.0 },
---   { 1000, 1.5 }
--- }
--- ```
--- @param timing integer
--- @param endTiming integer
--- @param startX number
--- @param endX number
--- @param easing string
--- @param startY number
--- @param endY number
--- @param colorID integer
--- @param sfxName string
--- @param isTrace boolean
--- @param arctaps table
--- @return LuaArcNote
function NoteEditor.AddArcNote(timing, endTiming, startX, endX, easing, startY, endY, colorID, sfxName, isTrace, arctaps) end

--- Add an Arc note with ArcTap Note list.
--- 
--- Example:
--- ```lua
--- -- { time, ... }
--- local arctaps = {
---   0, 1000
--- }
--- 
--- -- { { time, width }, ... }
--- local arctaps = {
---   { 0, 2.0 },
---   { 1000, 1.5 }
--- }
--- ```
--- @param timing integer
--- @param endTiming integer
--- @param startX number
--- @param endX number
--- @param easing ArcLineType
--- @param startY number
--- @param endY number
--- @param colorID integer
--- @param sfxName string
--- @param isTrace boolean
--- @param arctaps table
--- @return LuaArcNote
function NoteEditor.AddArcNote(timing, endTiming, startX, endX, easing, startY, endY, colorID, sfxName, isTrace, arctaps) end

--- @enum CameraEasing
CameraEasing = {
  L = 0,
  Qi = 1,
  Qo = 2,
  Reset = 3,
}

--- Add a Camera Event.
--- @param timing integer
--- @param move Vec3
--- @param rotate Vec3
--- @param ease CameraEasing
--- @param duration integer
--- @return LuaCameraControl
function NoteEditor.AddCameraControl(timing, move, rotate, ease, duration) end

--- @enum SceneControlType
SceneControlType = {
  TrackHide = 0,
  TrackShow = 1,
  HideGroup = 2,
  TrackDisplay = 3,
  ArcahvDistort = 4,
  ArcahvDebris = 5,
  Redline = 6,
  EnwidenCamera = 7,
  EnwidenLanes = 8,
  CameraEffect = 9,
  FadingTrack = 10,
  FadingInfo = 11,
  Unknown = -1,
}

--- Add a SceneControl Event.
--- @param timing integer
--- @param type SceneControlType
--- @param floatArg number
--- @param intArg integer
function NoteEditor.AddInternalSceneControl(timing, type, floatArg, intArg) end

--- Add a SceneControl Event.
--- @param timing integer
--- @param type string
function NoteEditor.AddSceneControl(timing, type) end

--- Add a SceneControl Event.
--- @param timing integer
--- @param type string
--- @param floatArg number
--- @param intArg integer
function NoteEditor.AddSceneControl(timing, type, floatArg, intArg) end

--- Add a SceneControl Event.
--- @param timing integer
--- @param type string
--- @param args any
function NoteEditor.AddSceneControl(timing, type, args) end

--- Select all events within the specified time range.
--- @param startTiming integer
--- @param endTiming integer
--- @return List<Object>
function NoteEditor.SelectEventsInRange(startTiming, endTiming) end

--- Select all events within the specified time range in the current group.
--- @param startTiming integer
--- @param endTiming integer
--- @return List<Object>
function NoteEditor.SelectEventsInRangeWithinCurrentGroup(startTiming, endTiming) end

--- Select events of the specified type within the specified time range.
--- @param type ("LuaTapNote" | "LuaHoldNote" | "LuaArcNote" | "LuaArcTapNote" | "LuaFlickNote" | "LuaCameraControl")
--- @param startTiming integer
--- @param endTiming integer
--- @return List<Object>
function NoteEditor.SelectEventsInRangeWithType(type, startTiming, endTiming) end

--- Select events of the specified type within the specified time range in the current group.
--- @param type ("LuaTapNote" | "LuaHoldNote" | "LuaArcNote" | "LuaArcTapNote" | "LuaFlickNote" | "LuaCameraControl")
--- @param startTiming integer
--- @param endTiming integer
--- @return List<Object>
function NoteEditor.SelectEventsInRangeWithTypeWithinCurrentGroup(type, startTiming, endTiming) end

--- Select timing events within the specified time range in the specified group.
--- @param startTiming integer
--- @param endTiming integer
--- @param groupID integer
--- @return List<LuaTimingEvent>
function NoteEditor.SelectTimingEventsInRange(startTiming, endTiming, groupID) end

--- @param startTiming integer
--- @param endTiming integer
--- @return List<LuaTimingEvent>
function NoteEditor.SelectTimingEventsInRangeWithinCurrentGroup(startTiming, endTiming) end

--- Select timing event by time, return null if no found.
--- @param time integer
--- @param groupID integer
--- @return LuaTimingEvent
function NoteEditor.SelectTimingEvent(time, groupID) end

--- Select timing event by time in current group, return null if no found.
--- @param time integer
--- @return LuaTimingEvent
function NoteEditor.SelectTimingEvent(time) end

--- @param e ILuaEvent
function NoteEditor.RemoveEvent(e) end

--- @param events ICollection<ILuaEvent>
function NoteEditor.RemoveEvents(events) end

--- @param events ICollection<Object>
function NoteEditor.RemoveEvents(events) end

--- @param events ICollection<LuaTimingEvent>
function NoteEditor.RemoveEvents(events) end

--- @param events table
function NoteEditor.RemoveEvents(events) end

--- @static<br/>
--- @return List<Object>
function NoteEditor.GetSelectedNotes() end

--- The unit of the result is milliseconds.
--- @param timing integer
--- @param density number
--- @param groupId integer
--- @return number
function NoteEditor.GetIntervalOfBeatlineAtTiming(timing, density, groupId) end

--- The density of beatline use the current subdivision density of grid lines (The number of subdivisions within a quarter note).
--- The unit of the result is milliseconds.
--- @param timing integer
--- @param groupId integer
--- @return number
function NoteEditor.GetIntervalOfBeatlineAtTiming(timing, groupId) end

--- The unit of the result is milliseconds.
--- @param timing integer
--- @param density number
--- @return number
function NoteEditor.GetIntervalOfBeatlineAtTimingInCurrentGroup(timing, density) end

--- The density of beatline use the current subdivision density of grid lines (The number of subdivisions within a quarter note).
--- The unit of the result is milliseconds.
--- @param timing integer
--- @return number
function NoteEditor.GetIntervalOfBeatlineAtTimingInCurrentGroup(timing) end

--- Create an editing task.
--- ```lua
--- -- args: { selectedNotes, ... }
--- local editing = NoteEditor.CreateEditing(
---   function(args)
---     -- do something
---   end
--- )
--- ```
--- @param _function function
--- @return AsyncEditing
function NoteEditor.CreateEditing(_function) end

--- @class NoteEditor
--- public get
--- @field public TimingGroupCount integer
--- public get
--- @field public BeatlineDensity number
NoteEditor = {}


--- @return string
function Project.GetCurrentAudioPath() end

--- @class Project
Project = {}


--- @return integer
function Random.RandInt() end

--- @return number
function Random.RandFloat() end

--- @param minValue integer
--- @param maxValue integer
--- @return integer
function Random.RandInt(minValue, maxValue) end

--- @param a number
--- @param b number
--- @return number
function Random.RandFloat(a, b) end

--- @param seed number
--- @return number
function Random.RandF(seed) end

--- @class Random
Random = {}


--- Get track child by name.
--- @param name ("Divider01" | "Divider12" | "Divider23" | "Divider34" | "Divider45" | "CriticalLine0" | "CriticalLine1" | "CriticalLine2" | "CriticalLine3" | "CriticalLine4" | "CriticalLine5")
--- @return SpriteRendererComponent
function Scene.GetTrackChildByName(name) end

--- @param alpha integer
--- @param duration number
function Scene.DoTrackFade(alpha, duration) end

--- @param showUnderlay boolean
function Scene.DoBackgroundUnderlay(showUnderlay) end

--- Set the opacity of the track dividers. (default: 210)
--- @param opacity number
function Scene.SetDividerOpacity(opacity) end

--- Set the opacity of the track dividers with default opacity multiplier.
--- @param opacity number
function Scene.SetDividerOpacityMultiplier(opacity) end

--- Set the opacity of the critical lines.
--- @param opacity number
function Scene.SetCriticalLineOpacity(opacity) end

--- Set the texture of the track.
--- @param filePath string Default directory is current script folder.
function Scene.SetTrackTexture(filePath) end

--- Set the texture of the track and extra lanes.
--- @param filePath string Default directory is current script folder.
--- @param extraLaneFilePath string Default directory is current script folder.
function Scene.SetTrackTexture(filePath, extraLaneFilePath) end

--- Set the texture of the track and extra lanes.
--- @param filePath string Default directory is current script folder.
--- @param extraLaneLeftFilePath string Default directory is current script folder.
--- @param extraLaneRightFilePath string Default directory is current script folder.
function Scene.SetTrackTexture(filePath, extraLaneLeftFilePath, extraLaneRightFilePath) end

--- Set the visibility of the water surface in the scene.
--- @param enabled boolean
function Scene.SetSceneWaterEnabled(enabled) end

--- @param themeName string
function Scene.SetTheme(themeName) end

--- @class Scene
--- @field public LastTheme string
--- The opacity of the track layer.<br>public get<br>public set
--- @field public TrackLayerOpacity number
--- The opacity of the track.<br>public get<br>public set
--- @field public TrackOpacity number
--- The fading progress of the track.<br>public get<br>public set
--- @field public TrackFading number
--- The rect cull progress of the track.<br>public get<br>public set
--- @field public TrackRectCull number
--- The phase of the track.<br>public get
--- @field public TrackPhase number
--- The phase of single lines.<br>public get
--- @field public SingleLinePhase number
--- The opacity of the single line left (0 ~ 255).<br>public get<br>public set
--- @field public SingleLineLeftOpacity number
--- The opacity of the single line right (0 ~ 255).<br>public get<br>public set
--- @field public SingleLineRightOpacity number
--- Dividers of the track.<br>public get
--- @field public TrackDividers List<SpriteRendererComponent>
--- Critical lines of the track.<br>public get
--- @field public CriticalLines List<SpriteRendererComponent>
--- Set the opacity of the water surface in the scene. (range: 0~1)<br>public get<br>public set
--- @field public SceneWaterOpacity number
--- Set the tint color of the water surface in the scene.<br>public get<br>public set
--- @field public SceneWaterTint Color
Scene = {}


--- @static<br/>
--- @param str string
--- @param separator string
--- @param removeEmptyEntries boolean
--- @return Array<string>
function String.Split(str, separator, removeEmptyEntries) end

--- @static<br/>
--- @param str string
--- @param prefix string
--- @return boolean
function String.StartsWith(str, prefix) end

--- @static<br/>
--- @param str string
--- @param suffix string
--- @return boolean
function String.EndsWith(str, suffix) end

--- @static<br/>
--- @param str string
--- @param oldValue string
--- @param newValue string
--- @return string
function String.Replace(str, oldValue, newValue) end

--- @static<br/>
--- @param str string
--- @return string
function String.Trim(str) end

--- @static<br/>
--- @param str string
--- @param trimChars Object
--- @return string
function String.Trim(str, trimChars) end

--- @static<br/>
--- @param str string
--- @return string
function String.TrimStart(str) end

--- @static<br/>
--- @param str string
--- @param trimChars Object
--- @return string
function String.TrimStart(str, trimChars) end

--- @static<br/>
--- @param str string
--- @return string
function String.TrimEnd(str) end

--- @static<br/>
--- @param str string
--- @param trimChars Object
--- @return string
function String.TrimEnd(str, trimChars) end

--- @static<br/>
--- @param separator string
--- @param values Object
--- @return string
function String.Join(separator, values) end

--- @static<br/>
--- @param format string
--- @param values Object
--- @return string
function String.Format(format, values) end

--- @class String
String = {}


--- Copy content to clipboard.
--- @param content string
function System.CopyContent(content) end

--- Get names of OS installed fonts.
--- @return Array<string>
function System.GetOSInstalledFontNames() end

--- Get names of internal fonts.
--- @return Array<string>
function System.GetInternalFontNames() end

--- Get paths to OS fonts.
--- @return Array<string>
function System.GetPathsToOSFonts() end

--- @class System
System = {}


--- @enum MessageType
MessageType = {
  Default = 0,
  Normal = 1,
  Error = 2,
  Off = 3,
  On = 4,
  Meme = 5,
}

--- Show message by message type
--- @param type MessageType
--- @param message string
function Toast.Show(type, message) end

--- Show message
--- @param message string
function Toast.Show(message) end

--- Show error message
--- @param message string
function Toast.ShowError(message) end

--- Show message at top
--- @param message string
function Toast.ShowTop(message) end

--- @class Toast
Toast = {}


--- @static<br/>
--- @param name string
--- @return Type
function Type.GetType(name) end

--- @class Type
Type = {}


--- @class Time
--- public get
--- @field public time number
--- public get
--- @field public timeSinceLevelLoad number
--- public get
--- @field public deltaTime number
--- public get
--- @field public fixedTime number
--- public get
--- @field public unscaledTime number
--- public get
--- @field public fixedUnscaledTime number
--- public get
--- @field public unscaledDeltaTime number
--- public get
--- @field public fixedUnscaledDeltaTime number
--- public get
--- @field public smoothDeltaTime number
--- public get
--- @field public frameCount integer
--- public get
--- @field public renderedFrameCount integer
--- public get
--- @field public realtimeSinceStartup number
--- public get
--- @field public inFixedTimeStep boolean
Time = {}


--- @static<br/>
--- @param message string
function Debug.Log(message) end

--- @static<br/>
--- @param message string
function Debug.LogError(message) end

--- @static<br/>
--- @param message string
function Debug.LogWarning(message) end

--- @class Debug
Debug = {}


--- @static<br/>
--- @return Vec2
function Screen.GetDesignResolutionSize() end

--- @class Screen
--- public get
--- @field public Width integer
--- public get
--- @field public Height integer
Screen = {}


function LuaPostProcessingProfile.Use() end

--- @class LuaPostProcessingProfile
--- public get
--- @field public DepthOfField LuaDepthOfFieldModel
--- public get
--- @field public MotionBlur LuaMotionBlurModel
--- public get
--- @field public Bloom LuaBloomModel
--- public get
--- @field public ColorGrading LuaColorGradingModel
--- public get
--- @field public ChromaticAberration LuaChromaticAberrationModel
--- public get
--- @field public Grain LuaGrainModel
--- public get
--- @field public Vignette LuaVignetteModel
LuaPostProcessingProfile = {}


--- @param value number
function GateControllerLua.SetGlitchIntensity(value) end

--- @param value number
function GateControllerLua.SetAberrationIntensity(value) end

--- @param value number
function GateControllerLua.SetHueProgress(value) end

--- @param value number
function GateControllerLua.SetDesatIntensity(value) end

--- @param value Vec2
function GateControllerLua.SetAberrationDirectionNorm(value) end

--- @class GateControllerLua
--- public get<br>public set
--- @field public Enabled boolean
GateControllerLua = {}


--- @class ImageEffect
--- public get
--- @field public TCAController TransverseChromaticAberrationControllerLua
--- public get
--- @field public GateController GateControllerLua
--- public get
--- @field public CustomPostProcessing CustomPostProcessingController
ImageEffect = {}


--- @param min number
--- @param max number
function TransverseChromaticAberrationControllerLua.SetIntensity(min, max) end

--- @param value number
function TransverseChromaticAberrationControllerLua.SetStrength(value) end

--- @param value integer
function TransverseChromaticAberrationControllerLua.SetSampleCount(value) end

--- @class TransverseChromaticAberrationControllerLua
--- public get<br>public set
--- @field public Enabled boolean
TransverseChromaticAberrationControllerLua = {}


--- @class ICloneable<T>
ICloneable = {}


--- @class IColorIndexNote
--- public get<br>public set
--- @field public ColorIndex integer
IColorIndexNote = {}


--- @class ILuaEvent
--- public get
--- @field public GroupID integer
--- public get<br>public set
--- @field public Timing integer
ILuaEvent = {}


--- @class ILuaNote
ILuaNote = {}


--- @class IWidthNote
--- public get<br>public set
--- @field public Width number
IWidthNote = {}


--- @enum ArcType
ArcType = {
  Arc = 0,
  Trace = 1,
  Designant = 2,
}

--- Get arc x position at timing.
--- @param timing integer
--- @return number
function LuaArcNote.GetXAtTiming(timing) end

--- Get arc y position at timing.
--- @param timing integer
--- @return number
function LuaArcNote.GetYAtTiming(timing) end

--- Get arc x position at progress.
--- @param progress number
--- @return number
function LuaArcNote.GetXAt(progress) end

--- Get arc y position at progress.
--- @param progress number
--- @return number
function LuaArcNote.GetYAt(progress) end

--- @return List<integer>
function LuaArcNote.GetArcTapTimings() end

--- @return List<LuaArcTapNote>
function LuaArcNote.GetArcTapNotes() end

--- @param time integer
--- @return LuaArcTapNote
function LuaArcNote.AddArcTapNote(time) end

--- @param time integer
--- @param width number
--- @return LuaArcTapNote
function LuaArcNote.AddArcTapNote(time, width) end

--- @param note LuaArcTapNote
function LuaArcNote.RemoveArcTapNote(note) end

--- @return LuaArcNote
function LuaArcNote.Clone() end

--- @param angle number
function LuaArcNote.SetScaledArcTapZRotation(angle) end

--- Compare this LuaNote with other LuaNote.<br/>Returns true when the value of this LuaNote is the same as that of other LuaNote, false otherwise.
--- @param other ILuaNote
--- @return boolean
function LuaArcNote.ValueEquals(other) end

--- Compare this LuaNote with other LuaNote.<br/>Return true when the object of reference note of this LuaNote is the same as the object of reference note of other LuaNote, false otherwise.
--- @param other ILuaNote
--- @return boolean
function LuaArcNote.ReferenceEquals(other) end

--- Serialize this LuaEvent into an event statement.
--- If the event type is LuaArcTapNote, the event statement of its parent LuaArcNote will be returned.
--- @return string
function LuaArcNote.Serialize() end

--- LuaArcNote : LuaLongNote&lt;ArcArc&gt;
--- @class LuaArcNote : LuaLongNote<ArcArc>
--- public get<br>public set
--- @field public StartPosition Vec2
--- public get<br>public set
--- @field public EndPosition Vec2
--- public get<br>public set
--- @field public LineType ArcLineType
--- public get
--- @field public LineTypeString string
--- Color id of this arc.<br>public get<br>public set
--- @field public Color integer
--- Reference file name of sfx effect. (Identifier)<br>public get<br>public set
--- @field public SfxFileName string
--- public get<br>public set
--- @field public IsTrace boolean
--- public get<br>public set
--- @field public IsDesignant boolean
--- public get<br>public set
--- @field public ArcType ArcType
--- Arc smoothness; this field defines the segment count for the arc.<br>public get<br>public set
--- @field public Smoothness number
--- public get<br>public set
--- @field public ColorIndex integer
--- public get<br>public set
--- @field public FingerIndex integer
--- public get
--- @field public IsScaledArcTap boolean
--- public get
--- @field public RenderHead boolean
--- public get
--- @field public RenderHeightIndicator boolean
--- public get<br>public set
--- @field public Timing integer
--- public get<br>public set
--- @field public EndTiming integer
--- public get<br>public set
--- @field public Opacity number
--- public get<br>public set
--- @field public GroupID integer
LuaArcNote = {}


--- @param angle number
function LuaArcTapNote.SetZRotation(angle) end

--- @return LuaArcTapNote
function LuaArcTapNote.Clone() end

--- Compare this LuaNote with other LuaNote.<br/>Returns true when the value of this LuaNote is the same as that of other LuaNote, false otherwise.
--- @param other ILuaNote
--- @return boolean
function LuaArcTapNote.ValueEquals(other) end

--- Compare this LuaNote with other LuaNote.<br/>Return true when the object of reference note of this LuaNote is the same as the object of reference note of other LuaNote, false otherwise.
--- @param other ILuaNote
--- @return boolean
function LuaArcTapNote.ReferenceEquals(other) end

--- Serialize this LuaEvent into an event statement.
--- If the event type is LuaArcTapNote, the event statement of its parent LuaArcNote will be returned.
--- @return string
function LuaArcTapNote.Serialize() end

--- LuaArcTapNote : LuaNote&lt;ArcArcTap&gt;
--- @class LuaArcTapNote : LuaNote<ArcArcTap>
--- public get
--- @field public ParentArc LuaArcNote
--- public get<br>public set
--- @field public Width number
--- public get<br>public set
--- @field public ColorIndex integer
--- public get<br>public set
--- @field public FingerIndex integer
--- public get<br>public set
--- @field public Opacity number
--- public get<br>public set
--- @field public GroupID integer
--- public get<br>public set
--- @field public Timing integer
LuaArcTapNote = {}


--- @return LuaCameraControl
function LuaCameraControl.Clone() end

--- Serialize this LuaEvent into an event statement.
--- If the event type is LuaArcTapNote, the event statement of its parent LuaArcNote will be returned.
--- @return string
function LuaCameraControl.Serialize() end

--- LuaCameraControl : LuaEventBase&lt;ArcCamera&gt;
--- @class LuaCameraControl : LuaEventBase<ArcCamera>
--- public get<br>public set
--- @field public Move Vec3
--- public get<br>public set
--- @field public Rotate Vec3
--- public get<br>public set
--- @field public Easing CameraEasing
--- public get<br>public set
--- @field public Duration integer
--- public get<br>public set
--- @field public GroupID integer
--- public get<br>public set
--- @field public Timing integer
LuaCameraControl = {}


--- Serialize this LuaEvent into an event statement.
--- If the event type is LuaArcTapNote, the event statement of its parent LuaArcNote will be returned.
--- @return string
function LuaEventBase.Serialize() end

--- @class LuaEventBase<T>
--- public get<br>public set
--- @field public GroupID integer
--- public get<br>public set
--- @field public Timing integer
LuaEventBase = {}


--- @return LuaFlickNote
function LuaFlickNote.Clone() end

--- Compare this LuaNote with other LuaNote.<br/>Returns true when the value of this LuaNote is the same as that of other LuaNote, false otherwise.
--- @param other ILuaNote
--- @return boolean
function LuaFlickNote.ValueEquals(other) end

--- Compare this LuaNote with other LuaNote.<br/>Return true when the object of reference note of this LuaNote is the same as the object of reference note of other LuaNote, false otherwise.
--- @param other ILuaNote
--- @return boolean
function LuaFlickNote.ReferenceEquals(other) end

--- Serialize this LuaEvent into an event statement.
--- If the event type is LuaArcTapNote, the event statement of its parent LuaArcNote will be returned.
--- @return string
function LuaFlickNote.Serialize() end

--- LuaFlickNote : LuaNote&lt;ArcFlick&gt;
--- @class LuaFlickNote : LuaNote<ArcFlick>
--- public get<br>public set
--- @field public Position Vec2
--- public get<br>public set
--- @field public Vector Vec2
--- public get<br>public set
--- @field public Opacity number
--- public get<br>public set
--- @field public GroupID integer
--- public get<br>public set
--- @field public Timing integer
LuaFlickNote = {}


--- @return LuaHoldNote
function LuaHoldNote.Clone() end

--- Compare this LuaNote with other LuaNote.<br/>Returns true when the value of this LuaNote is the same as that of other LuaNote, false otherwise.
--- @param other ILuaNote
--- @return boolean
function LuaHoldNote.ValueEquals(other) end

--- Compare this LuaNote with other LuaNote.<br/>Return true when the object of reference note of this LuaNote is the same as the object of reference note of other LuaNote, false otherwise.
--- @param other ILuaNote
--- @return boolean
function LuaHoldNote.ReferenceEquals(other) end

--- Serialize this LuaEvent into an event statement.
--- If the event type is LuaArcTapNote, the event statement of its parent LuaArcNote will be returned.
--- @return string
function LuaHoldNote.Serialize() end

--- LuaHoldNote : LuaLongNote&lt;ArcHold&gt;
--- @class LuaHoldNote : LuaLongNote<ArcHold>
--- public get
--- @field public IsFloatLane boolean
--- Track index (0~5)<br>public get<br>public set
--- @field public Track integer
--- Lane position (normally 0.0~1.0)<br>public get<br>public set
--- @field public Lane number
--- public get<br>public set
--- @field public ColorIndex integer
--- public get<br>public set
--- @field public FingerIndex integer
--- public get<br>public set
--- @field public Timing integer
--- public get<br>public set
--- @field public EndTiming integer
--- public get<br>public set
--- @field public Opacity number
--- public get<br>public set
--- @field public GroupID integer
LuaHoldNote = {}


--- Compare this LuaNote with other LuaNote.<br/>Returns true when the value of this LuaNote is the same as that of other LuaNote, false otherwise.
--- @param other ILuaNote
--- @return boolean
function LuaLongNote.ValueEquals(other) end

--- Compare this LuaNote with other LuaNote.<br/>Return true when the object of reference note of this LuaNote is the same as the object of reference note of other LuaNote, false otherwise.
--- @param other ILuaNote
--- @return boolean
function LuaLongNote.ReferenceEquals(other) end

--- Serialize this LuaEvent into an event statement.
--- If the event type is LuaArcTapNote, the event statement of its parent LuaArcNote will be returned.
--- @return string
function LuaLongNote.Serialize() end

--- LuaLongNote<T> : LuaNote&lt;T&gt;
--- @class LuaLongNote<T> : LuaNote<T>
--- public get<br>public set
--- @field public Timing integer
--- public get<br>public set
--- @field public EndTiming integer
--- public get<br>public set
--- @field public Opacity number
--- public get<br>public set
--- @field public GroupID integer
LuaLongNote = {}


--- Compare this LuaNote with other LuaNote.<br/>Returns true when the value of this LuaNote is the same as that of other LuaNote, false otherwise.
--- @param other ILuaNote
--- @return boolean
function LuaNote.ValueEquals(other) end

--- Compare this LuaNote with other LuaNote.<br/>Return true when the object of reference note of this LuaNote is the same as the object of reference note of other LuaNote, false otherwise.
--- @param other ILuaNote
--- @return boolean
function LuaNote.ReferenceEquals(other) end

--- Serialize this LuaEvent into an event statement.
--- If the event type is LuaArcTapNote, the event statement of its parent LuaArcNote will be returned.
--- @return string
function LuaNote.Serialize() end

--- LuaNote<T> : LuaEventBase&lt;T&gt;
--- @class LuaNote<T> : LuaEventBase<T>
--- public get<br>public set
--- @field public Opacity number
--- public get<br>public set
--- @field public GroupID integer
--- public get<br>public set
--- @field public Timing integer
LuaNote = {}


--- @return LuaTapNote
function LuaTapNote.Clone() end

--- Compare this LuaNote with other LuaNote.<br/>Returns true when the value of this LuaNote is the same as that of other LuaNote, false otherwise.
--- @param other ILuaNote
--- @return boolean
function LuaTapNote.ValueEquals(other) end

--- Compare this LuaNote with other LuaNote.<br/>Return true when the object of reference note of this LuaNote is the same as the object of reference note of other LuaNote, false otherwise.
--- @param other ILuaNote
--- @return boolean
function LuaTapNote.ReferenceEquals(other) end

--- Serialize this LuaEvent into an event statement.
--- If the event type is LuaArcTapNote, the event statement of its parent LuaArcNote will be returned.
--- @return string
function LuaTapNote.Serialize() end

--- LuaTapNote : LuaNote&lt;ArcTap&gt;
--- @class LuaTapNote : LuaNote<ArcTap>
--- public get
--- @field public IsFloatLane boolean
--- Track index (0~5)<br>public get<br>public set
--- @field public Track integer
--- Lane position (normally 0.0~1.0)<br>public get<br>public set
--- @field public Lane number
--- public get<br>public set
--- @field public ColorIndex integer
--- public get<br>public set
--- @field public FingerIndex integer
--- public get<br>public set
--- @field public Opacity number
--- public get<br>public set
--- @field public GroupID integer
--- public get<br>public set
--- @field public Timing integer
LuaTapNote = {}


--- @return LuaTimingEvent
function LuaTimingEvent.Clone() end

--- Serialize this LuaEvent into an event statement.
--- If the event type is LuaArcTapNote, the event statement of its parent LuaArcNote will be returned.
--- @return string
function LuaTimingEvent.Serialize() end

--- LuaTimingEvent : LuaEventBase&lt;ArcTiming&gt;
--- @class LuaTimingEvent : LuaEventBase<ArcTiming>
--- public get<br>public set
--- @field public Bpm number
--- public get<br>public set
--- @field public BeatsPerLine number
--- public get<br>public set
--- @field public GroupID integer
--- public get<br>public set
--- @field public Timing integer
LuaTimingEvent = {}


--- @class LuaTimingGroup
--- Index of this group.<br>public get
--- @field public ID integer
--- Whether notes in this group can be judged.<br>public get<br>public set
--- @field public NoInput boolean
--- Unhit Hold notes gradually fade based on their own judgement state until reaching the missed opacity.<br>public get<br>public set
--- @field public FadingHolds boolean
--- <br>public get<br>public set
--- @field public Angle Vec2Int
--- Opacity of notes in this group.<br>public get<br>public set
--- @field public Opacity integer
LuaTimingGroup = {}


--- Check if the specified event is a lane note.
--- @param e ILuaEvent
--- @return boolean
function NoteEvent.IsLaneNote(e) end

--- Check if the specified event is a note.
--- @param e ILuaEvent
--- @return boolean
function NoteEvent.IsNote(e) end

--- Check if the specified event is a Timing Event.
--- @param e ILuaEvent
--- @return boolean
function NoteEvent.IsTiming(e) end

--- Check if the specified event is a Tap Note.
--- @param e ILuaEvent
--- @return boolean
function NoteEvent.IsTap(e) end

--- Check if the specified event is a Hold Note.
--- @param e ILuaEvent
--- @return boolean
function NoteEvent.IsHold(e) end

--- Check if the specified event is a Arc Note.
--- @param e ILuaEvent
--- @return boolean
function NoteEvent.IsArc(e) end

--- Check if the specified event is a ArcTap Note.
--- @param e ILuaEvent
--- @return boolean
function NoteEvent.IsArcTap(e) end

--- Check if the specified event is a Flick Note.
--- @param e ILuaEvent
--- @return boolean
function NoteEvent.IsFlick(e) end

--- Check if the specified event is a Camera Event.
--- @param e ILuaEvent
--- @return boolean
function NoteEvent.IsCamera(e) end

--- Returns the Event Type ID corresponding to the event.
--- | Event Type | ID |
--- | --- | --- |
--- | TapNote | 1 |
--- | HoldNote | 2 |
--- | ArcNote | 3 |
--- | ArcTapNote | 6 |
--- | FlickNote | 4 |
--- | TimingEvent | 5 |
--- | ... | 0 |
--- @param e ILuaEvent
--- @return integer
function NoteEvent.CalculateType(e) end

--- Check if the specified event is a colorable note.
--- @param e ILuaEvent
--- @return boolean
function NoteEvent.IsColorIndexNote(e) end

--- Check if the specified event is a variable-width note.
--- @param e ILuaEvent
--- @return boolean
function NoteEvent.IsWidthNote(e) end

--- Attempts to cast the event to type TapNote; returns null (nil) if the cast fails.
--- @param e ILuaEvent
--- @return LuaTapNote
function NoteEvent.CastToTapNote(e) end

--- Attempts to cast the event to type HoldNote; returns null (nil) if the cast fails.
--- @param e ILuaEvent
--- @return LuaHoldNote
function NoteEvent.CastToHoldNote(e) end

--- Attempts to cast the event to type ArcNote; returns null (nil) if the cast fails.
--- @param e ILuaEvent
--- @return LuaArcNote
function NoteEvent.CastToArcNote(e) end

--- Attempts to cast the event to type ArcTapNote; returns null (nil) if the cast fails.
--- @param e ILuaEvent
--- @return LuaArcTapNote
function NoteEvent.CastToArcTapNote(e) end

--- Attempts to cast the event to type FlickNote; returns null (nil) if the cast fails.
--- @param e ILuaEvent
--- @return LuaFlickNote
function NoteEvent.CastToFlickNote(e) end

--- Attempts to cast the event to type CameraControl; returns null (nil) if the cast fails.
--- @param e ILuaEvent
--- @return LuaCameraControl
function NoteEvent.CastToCameraControl(e) end

--- @class NoteEvent
NoteEvent = {}


function ModelBase.Reset() end

--- @class ModelBase<T>
--- public get<br>public set
--- @field public Enabled boolean
ModelBase = {}


--- @enum KernelSize
KernelSize = {
  Small = 0,
  Medium = 1,
  Large = 2,
  VeryLarge = 3,
}

function LuaDepthOfFieldModel.Reset() end

--- LuaDepthOfFieldModel : ModelBase&lt;DepthOfFieldModel&gt;
--- @class LuaDepthOfFieldModel : ModelBase<DepthOfFieldModel>
--- public get<br>public set
--- @field public FocusDistance number
--- public get<br>public set
--- @field public Aperture number
--- public get<br>public set
--- @field public FocalLength number
--- public get<br>public set
--- @field public UseCameraFov boolean
--- public get<br>public set
--- @field public KernelSize KernelSize
--- public get<br>public set
--- @field public Enabled boolean
LuaDepthOfFieldModel = {}


function LuaMotionBlurModel.Reset() end

--- LuaMotionBlurModel : ModelBase&lt;MotionBlurModel&gt;
--- @class LuaMotionBlurModel : ModelBase<MotionBlurModel>
--- public get<br>public set
--- @field public ShutterAngle number
--- public get<br>public set
--- @field public SampleCount integer
--- public get<br>public set
--- @field public FrameBlending number
--- public get<br>public set
--- @field public Enabled boolean
LuaMotionBlurModel = {}


function LuaBloomModel.Reset() end

--- LuaBloomModel : ModelBase&lt;BloomModel&gt;
--- @class LuaBloomModel : ModelBase<BloomModel>
--- public get<br>public set
--- @field public Intensity number
--- public get<br>public set
--- @field public Threshold number
--- public get<br>public set
--- @field public ThresholdLinear number
--- public get<br>public set
--- @field public SoftKnee number
--- public get<br>public set
--- @field public Radius number
--- public get<br>public set
--- @field public AntiFlicker boolean
--- public get<br>public set
--- @field public LensDirtTexture Texture
--- public get<br>public set
--- @field public LensDirtIntensity number
--- public get<br>public set
--- @field public Enabled boolean
LuaBloomModel = {}


--- @enum Tonemapper
Tonemapper = {
  None = 0,
  ACES = 1,
  Neutral = 2,
}

function LuaColorGradingModel.Reset() end

--- LuaColorGradingModel : ModelBase&lt;ColorGradingModel&gt;
--- @class LuaColorGradingModel : ModelBase<ColorGradingModel>
--- <b>Tonemapping</b><br>public get<br>public set
--- @field public Tonemapper Tonemapper
--- <b>Tonemapping</b><br>public get<br>public set
--- @field public NeutralBlackIn number
--- <b>Tonemapping</b><br>public get<br>public set
--- @field public NeutralWhiteIn number
--- <b>Tonemapping</b><br>public get<br>public set
--- @field public NeutralBlackOut number
--- <b>Tonemapping</b><br>public get<br>public set
--- @field public NeutralWhiteOut number
--- <b>Tonemapping</b><br>public get<br>public set
--- @field public NeutralWhiteLevel number
--- <b>Tonemapping</b><br>public get<br>public set
--- @field public NeutralWhiteClip number
--- <b>Basic</b><br>public get<br>public set
--- @field public PostExposure number
--- <b>Basic</b><br>public get<br>public set
--- @field public Temperature number
--- <b>Basic</b><br>public get<br>public set
--- @field public Tint number
--- <b>Basic</b><br>public get<br>public set
--- @field public HueShift number
--- <b>Basic</b><br>public get<br>public set
--- @field public Saturation number
--- <b>Basic</b><br>public get<br>public set
--- @field public Contrast number
--- <b>ChannelMixer</b><br>public get<br>public set
--- @field public MixerRed Vec3
--- <b>ChannelMixer</b><br>public get<br>public set
--- @field public MixerGreen Vec3
--- <b>ChannelMixer</b><br>public get<br>public set
--- @field public MixerBlue Vec3
--- <b>ColorWheels.LogWheels</b><br>public get<br>public set
--- @field public LogWheelSlope Color
--- <b>ColorWheels.LogWheels</b><br>public get<br>public set
--- @field public LogWheelPower Color
--- <b>ColorWheels.LogWheels</b><br>public get<br>public set
--- @field public LogWheelOffset Color
--- <b>ColorWheels.LinearWheels</b><br>public get<br>public set
--- @field public LinearWheelLift Color
--- <b>ColorWheels.LinearWheels</b><br>public get<br>public set
--- @field public LinearWheelGamma Color
--- <b>ColorWheels.LinearWheels</b><br>public get<br>public set
--- @field public LinearWheelGain Color
--- <b>Curves</b><br>public get<br>public set
--- @field public MasterCurve ColorGradingCurve
--- <b>Curves</b><br>public get<br>public set
--- @field public RedCurve ColorGradingCurve
--- <b>Curves</b><br>public get<br>public set
--- @field public GreenCurve ColorGradingCurve
--- <b>Curves</b><br>public get<br>public set
--- @field public BlueCurve ColorGradingCurve
--- <b>Curves</b><br>public get<br>public set
--- @field public HueVShueCurve ColorGradingCurve
--- <b>Curves</b><br>public get<br>public set
--- @field public HueVSsatCurve ColorGradingCurve
--- <b>Curves</b><br>public get<br>public set
--- @field public SatVSsatCurve ColorGradingCurve
--- <b>Curves</b><br>public get<br>public set
--- @field public LumVSsatCurve ColorGradingCurve
--- public get<br>public set
--- @field public Enabled boolean
LuaColorGradingModel = {}


function LuaChromaticAberrationModel.Reset() end

--- LuaChromaticAberrationModel : ModelBase&lt;ChromaticAberrationModel&gt;
--- @class LuaChromaticAberrationModel : ModelBase<ChromaticAberrationModel>
--- public get<br>public set
--- @field public Intensity number
--- public get<br>public set
--- @field public Center Vec2
--- public get<br>public set
--- @field public SampleCount Vec2
--- public get<br>public set
--- @field public Enabled boolean
LuaChromaticAberrationModel = {}


function LuaGrainModel.Reset() end

--- LuaGrainModel : ModelBase&lt;GrainModel&gt;
--- @class LuaGrainModel : ModelBase<GrainModel>
--- public get<br>public set
--- @field public Colored boolean
--- public get<br>public set
--- @field public Intensity number
--- public get<br>public set
--- @field public Size number
--- public get<br>public set
--- @field public LuminanceContribution number
--- public get<br>public set
--- @field public Enabled boolean
LuaGrainModel = {}


function LuaVignetteModel.Reset() end

--- @enum VignetteMode
VignetteMode = {
  Classic = 0,
  Masked = 1,
}

--- LuaVignetteModel : ModelBase&lt;VignetteModel&gt;
--- @class LuaVignetteModel : ModelBase<VignetteModel>
--- public get<br>public set
--- @field public Mode VignetteMode
--- public get<br>public set
--- @field public Color Color
--- public get<br>public set
--- @field public Center Vec2
--- public get<br>public set
--- @field public Intensity number
--- public get<br>public set
--- @field public Smoothness number
--- public get<br>public set
--- @field public Roundness number
--- public get<br>public set
--- @field public Mask Texture
--- public get<br>public set
--- @field public Opacity number
--- public get<br>public set
--- @field public Rounded boolean
--- public get<br>public set
--- @field public Enabled boolean
LuaVignetteModel = {}


