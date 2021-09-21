import 'model/inventory.dart';
import 'model/item.dart';

void seeder(){
  Inventory.addItem(Item('BRG-1', 'Pensil', 100));
  Inventory.addItem(Item('BRG-2', 'Pulpen', 50));
  Inventory.addItem(Item('BRG-3', 'Buku', 15));
  Inventory.addItem(Item('BRG-4', 'Penggaris', 20));
}