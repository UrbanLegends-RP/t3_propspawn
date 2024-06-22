```
___________________         _________            .__        __          
\__    ___/\_____  \       /   _____/ ___________|__|______/  |_  ______
  |    |     _(__  <       \_____  \_/ ___\_  __ \  \____ \   __\/  ___/
  |    |    /       \      /        \  \___|  | \/  |  |_> >  |  \___ \ 
  |____|   /______  /     /_______  /\___  >__|  |__|   __/|__| /____  >
                  \/              \/     \/         |__|             \/ 
```

# T3 Prop Spawn Script

This QBCore script allows players to spawn and delete props in-game using a categorized menu. The menu categorizes props into submenus for easier navigation.

## Features

- Categorized menu for selecting props
- Props lock to the ground when spawned
- Option to delete all spawned props
- Easy to configure with a wide variety of props

## Installation

1. **Download and Extract**:
   - Download the script files and extract them into your resources folder.

2. **Add to Server Configuration**:
   - Add the following lines to your `server.cfg` to ensure the resources are started:
     ```plaintext
     ensure qb-core
     ensure qb-menu
     ensure t3_propspawn
     ```

## Configuration

1. **Edit Props Configuration**:
   - Open the `config.lua` file and add or modify the props as needed. Each prop should have a name, label, and category.
     ```lua
     Config = {}

     Config.Props = {
         {name = "prop_chair_01a", label = "Chair", category = "Furniture"},
         {name = "prop_table_01a", label = "Table", category = "Furniture"},
         -- Add more props here
     }
     ```

## Usage

1. **Open the Prop Menu**:
   - In-game, use the following command to open the prop selection menu:
     ```plaintext
     /propMenu
     ```

2. **Select a Category**:
   - Choose a category from the main menu. This will open a submenu with the props in that category.

3. **Select and Spawn Prop**:
   - Select the desired prop from the submenu. The prop will spawn at your current location and adjust its Z-coordinate to lock to the ground.

4. **Delete All Spawned Props**:
   - Select the "Delete All Props" option from the main menu to delete all props spawned by this script.

## Script Details

### t3_propspawn/config.lua

```lua
Config = {}

-- List of props to spawn with categories
Config.Props = {
    {name = "prop_chair_01a", label = "Chair", category = "Furniture"},
    {name = "prop_table_01a", label = "Table", category = "Furniture"},
    {name = "prop_bench_01a", label = "Bench", category = "Furniture"},
    {name = "prop_chair_02", label = "Chair 2", category = "Furniture"},
    {name = "prop_couch_01", label = "Couch", category = "Furniture"},
    {name = "prop_laptop_01a", label = "Laptop", category = "Electronics"},
    {name = "prop_tv_01", label = "TV", category = "Electronics"},
    {name = "prop_bush_01a", label = "Bush", category = "Nature"},
    {name = "prop_tree_01", label = "Tree", category = "Nature"},
    {name = "prop_plant_01a", label = "Plant", category = "Nature"},
    {name = "prop_fire_exting_1a", label = "Fire Extinguisher", category = "Tools"},
    {name = "prop_barrel_01a", label = "Barrel", category = "Miscellaneous"},
    {name = "prop_bin_01a", label = "Trash Bin", category = "Miscellaneous"},
    {name = "prop_rock_4_cl_2", label = "Rock", category = "Nature"},
    {name = "prop_pallet_01a", label = "Pallet", category = "Miscellaneous"},
    {name = "prop_sign_road_01a", label = "Road Sign", category = "Miscellaneous"},
    {name = "prop_picnic_table_01", label = "Picnic Table", category = "Furniture"},
    {name = "prop_traffic_01a", label = "Traffic Cone", category = "Miscellaneous"},
    {name = "prop_fountain_01a", label = "Fountain", category = "Nature"},
    {name = "prop_parking_wand_01", label = "Parking Wand", category = "Tools"},
    {name = "prop_boxpile_06a", label = "Box Pile", category = "Miscellaneous"},
    {name = "prop_barrier_work06a", label = "Work Barrier", category = "Tools"},
    {name = "prop_haybale_01", label = "Hay Bale", category = "Nature"},
    {name = "prop_lawnmower_01", label = "Lawn Mower", category = "Tools"},
    {name = "prop_tool_box_04", label = "Tool Box", category = "Tools"},
    {name = "prop_skate_flatramp_cr", label = "Skate Ramp", category = "Sports"},
    {name = "prop_patio_lounger1", label = "Patio Lounger", category = "Furniture"},
    {name = "prop_gazebo_01", label = "Gazebo", category = "Furniture"},
    {name = "prop_chair_04a", label = "Office Chair", category = "Furniture"},
    {name = "prop_crate_03a", label = "Crate", category = "Miscellaneous"},
    {name = "prop_boombox_01", label = "Boombox", category = "Electronics"},
    {name = "prop_dart_bd_01", label = "Dart Board", category = "Sports"},
    {name = "prop_asteroid_01", label = "Asteroid", category = "Miscellaneous"},
    {name = "prop_bomb_01", label = "Bomb", category = "Miscellaneous"},
    {name = "prop_dock_bouy_1", label = "Dock Buoy", category = "Miscellaneous"},
    {name = "prop_kitch_juicer", label = "Juicer", category = "Electronics"},
    {name = "prop_air_conditioner_01", label = "Air Conditioner", category = "Electronics"},
    {name = "prop_roadcone01a", label = "Road Cone", category = "Miscellaneous"},
    {name = "prop_wateringcan", label = "Watering Can", category = "Tools"}
}
