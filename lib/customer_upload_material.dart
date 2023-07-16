import 'package:flutter/material.dart';
import 'dart:io';

class CustomerUploadMaterialPage extends StatefulWidget {
  const CustomerUploadMaterialPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomerUploadMaterialPageState createState() =>
      _CustomerUploadMaterialPageState();
}

class _CustomerUploadMaterialPageState
    extends State<CustomerUploadMaterialPage> {
  File? idCardFrontImage;
  File? idCardBackImage;
  File? licenseFrontImage;
  File? licenseBackImage;

  Future<void> _takePhoto(ImageType imageType) async {
    // 使用相機拍照並取得圖片檔案
    // 這裡使用你選擇的相機套件或是相機API來實作拍照功能
    // 當使用者完成拍照後，將圖片檔案設定給對應的imageType

    setState(() {
      // 根據imageType更新對應的圖片檔案變數
    });
  }

  Future<void> _selectFile(ImageType imageType) async {
    // 選擇檔案並取得圖片檔案
    // 這裡使用你選擇的檔案選擇套件或是檔案選擇API來實作選擇檔案功能
    // 當使用者完成選擇檔案後，將圖片檔案設定給對應的imageType

    setState(() {
      // 根據imageType更新對應的圖片檔案變數
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('上傳資料'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildImageSelectionSection(
            '身分證正面',
            idCardFrontImage,
            ImageType.idCardFront,
          ),
          const SizedBox(height: 16.0),
          _buildImageSelectionSection(
            '身分證背面',
            idCardBackImage,
            ImageType.idCardBack,
          ),
          const SizedBox(height: 16.0),
          _buildImageSelectionSection(
            '行照正面',
            licenseFrontImage,
            ImageType.licenseFront,
          ),
          const SizedBox(height: 16.0),
          _buildImageSelectionSection(
            '行照背面',
            licenseBackImage,
            ImageType.licenseBack,
          ),
          const SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: () {
              // 執行上傳資料的相關操作
              // 可以將選擇好的圖片檔案傳送給後端或是進行其他處理

              // 以下是一個範例，用於顯示選擇的圖片
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('已選擇的圖片'),
                  content: Column(
                    children: [
                      if (idCardFrontImage != null)
                        Image.file(idCardFrontImage!),
                      if (idCardBackImage != null) Image.file(idCardBackImage!),
                      if (licenseFrontImage != null)
                        Image.file(licenseFrontImage!),
                      if (licenseBackImage != null)
                        Image.file(licenseBackImage!),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('確定'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('上傳資料'),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSelectionSection(
    String title,
    File? imageFile,
    ImageType imageType,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        if (imageFile == null)
          ElevatedButton.icon(
            onPressed: () {
              _showImageSelectionDialog(imageType);
            },
            icon: const Icon(Icons.camera_alt),
            label: const Text('拍照或選檔案'),
          )
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.file(imageFile),
              const SizedBox(height: 8.0),
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    // 清除對應的圖片檔案
                  });
                },
                icon: const Icon(Icons.delete),
                label: const Text('刪除'),
              ),
            ],
          ),
      ],
    );
  }

  Future<void> _showImageSelectionDialog(ImageType imageType) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('選擇圖片'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('拍照'),
              onTap: () {
                Navigator.pop(context);
                _takePhoto(imageType);
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('選檔案'),
              onTap: () {
                Navigator.pop(context);
                _selectFile(imageType);
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum ImageType {
  idCardFront,
  idCardBack,
  licenseFront,
  licenseBack,
}
