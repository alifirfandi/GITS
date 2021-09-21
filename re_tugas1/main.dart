import 'dart:io';

import 'model/inventory.dart';
import 'model/item.dart';
import 'seed.dart';

void main(List<String> arguments) {
  seeder();
  showMenu();
}

enum Type { INCREASE, DECREASE }

void showMenu() {
  print('-------- Kelola Gudang --------');
  print('Menu : ');
  print('1. Lihat Stok Barang');
  print('2. Tambah Barang');
  print('3. Tambah Stok Barang');
  print('4. Kurang Stok Barang');
  print('5. Hapus Barang');
  print('6. Keluar');
  print('-------------------------------');
  stdout.write('=> ');

  String? menu = stdin.readLineSync();
  switch (menu) {
    case '1':
      showAllItem();
      break;
    case '2':
      insertItem();
      break;
    case '3':
      changeQtyItem(Type.INCREASE);
      break;
    case '4':
      changeQtyItem(Type.DECREASE);
      break;
    case '5':
      deleteItem();
      break;
    case '6':
      print('Keluar');
      break;
    default:
      showMenu();
  }
}

void showAllItem() {
  Inventory.showItem();
  showMenu();
}

void insertItem() {
  stdout.write('Nama : ');
  String? itemName = stdin.readLineSync();
  stdout.write('Stok : ');
  String? itemStock = stdin.readLineSync();

  if (itemName == null || itemStock == null) return;

  String idItem = 'BRG-${Inventory.itemCounter() + 1}';
  Item newItem = Item(idItem, itemName, int.parse(itemStock));
  Inventory.addItem(newItem);

  print('! Sukses menambah barang !');
  showMenu();
}

void deleteItem() {
  stdout.write('ID Barang : ');
  String? itemId = stdin.readLineSync();

  if (itemId == null) return;
  itemId = itemId.toUpperCase();

  int indexItem = Inventory.searchItem(itemId);
  if (indexItem == -1)
    print("ID Tidak valid!");
  else {
    Inventory.deleteItem(indexItem);
    print("Berhasil menghapus barang");
  }
  showMenu();
}

void changeQtyItem(Type type) {
  stdout.write('ID Barang : ');
  String? itemId = stdin.readLineSync();

  if (itemId == null) return;
  itemId = itemId.toUpperCase();

  int indexItem = Inventory.searchItem(itemId);
  if (indexItem == -1)
    print("ID Tidak valid!");
  else {
    stdout.write('Jumlah barang : ');

    int itemQty = int.parse(stdin.readLineSync() ?? '-1');
    if (itemQty < 0) return;

    bool subSuccess = true;

    if (type == Type.INCREASE)
      Inventory.increaseQty(itemQty, indexItem);
    else
      subSuccess = Inventory.decreaseQty(itemQty, indexItem);

    subSuccess == false
        ? print('Gagal! Stok kurang')
        : print('Berhasil mengubah stok barang');
  }
  showMenu();
}
