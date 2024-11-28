import 'dart:io';
import 'package:faltool/lib.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class ImageCompressTool {

  // static Future<ImageFile> _compressAndGetFile({
  //   required ImageFile file,
  //   required ImageOutputType outputType,
  //   int quality = 80,
  //   bool useJpgPngNativeCompressor = false,
  // }) async {
  //   return await compressor.compressJpg(
  //     ImageFileConfiguration(
  //       input: file,
  //       config: Configuration(
  //         outputType: outputType,
  //         quality: quality,
  //         useJpgPngNativeCompressor: useJpgPngNativeCompressor,
  //       ),
  //     ),
  //   );
  // }


  // static Future<XFile?> compressImageFile({required File file}) async {
  //   final saveTargetPath = await _getSaveTempTargetPath();
  //   return _compressAndGetFile(
  //     file: file,
  //     targetPath: saveTargetPath,
  //   );
  // }

// static Future<String> _getSaveTempTargetPath() async {
  //   // directory
  //   final dir = await path_provider.getTemporaryDirectory();
  //   final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
  //   // image path
  //   return '${dir.absolute.path}/$timeStamp.jpg';
  // }
  //
  // static Future<XFile?> _compressAndGetFile({
  //   required File file,
  //   required String targetPath,
  //   int minWidth = 1920,
  //   int minHeight = 1080,
  //   int inSampleSize = 1,
  //   int quality = 95,
  //   int rotate = 0,
  //   bool autoCorrectionAngle = true,
  //   CompressFormat format = CompressFormat.jpeg,
  //   bool keepExif = false,
  //   int numberOfRetries = 5,
  // }) async {
  //   return FlutterImageCompress.compressAndGetFile(
  //     file.absolute.path,
  //     targetPath,
  //     minWidth: minWidth,
  //     minHeight: minHeight,
  //     inSampleSize: inSampleSize,
  //     quality: quality,
  //     rotate: rotate,
  //     autoCorrectionAngle: autoCorrectionAngle,
  //     format: format,
  //     keepExif: keepExif,
  //     numberOfRetries: numberOfRetries,
  //   );
  // }
}
