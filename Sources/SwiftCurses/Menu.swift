//
//  Created by Jonathan Badger on 2/2/22.
// helpful doc at https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/menus.html

import Foundation
import ncurses

public class Menu {
    public var menuP: UnsafeMutablePointer<MENU>
    private var names: [[CChar]] = []
    private var descriptions: [[CChar]]? = nil
    var menuItems: [UnsafeMutablePointer<ITEM>?] = []
    
    public init(names: [String], descriptions: [String]? = nil, size: Size? = nil) {
        
        self.names = names.map({$0.cString(using: .utf8) ?? [0]})
        self.descriptions = descriptions == nil ? nil : descriptions!.map({$0.cString(using: .utf8) ?? [0]})
        for i in 0..<names.count {
            var item = self.names[i]
            var description: [CChar] = self.descriptions?[i] ?? [0]
            let newItem = new_item(&item, &description)
                menuItems.append(newItem)
        }
        menuItems.append(nil)
        menuP = new_menu(&menuItems)
            
        //default size is 16 rows, 1 col
        if let size = size {
            set_menu_format(menuP, size.height, size.width)
        }
    
    }
    
    deinit {
        free_menu(menuP)
        for menuItemP in menuItems {
          free_item(menuItemP)
        }
    }
    
    public func setForegroundAttributes(attributes: Attributes = [.reverse], colorPair: ColorPair? = nil) {
        if let colorPair = colorPair {
            let colorBits = chtype(COLOR_PAIR(Colors.shared.indexFor(colorPair: colorPair)))
            set_menu_fore(menuP, attributes.rawValue | colorBits)
        } else {
            set_menu_fore(menuP, attributes.rawValue)
        }
        
    }
    
    public func show() {
        post_menu(menuP)
    }
    
    public func hide() {
        unpost_menu(menuP)
    }
    
    public func navigate(key: Key) {
        if let keyCode = key.keyCode {
            switch keyCode {
            case .KEY_LEFT:
                menu_driver(menuP, REQ_LEFT_ITEM)
            case .KEY_RIGHT:
                menu_driver(menuP, REQ_RIGHT_ITEM)
            case .KEY_UP:
                menu_driver(menuP, REQ_UP_ITEM)
            case .KEY_DOWN:
                menu_driver(menuP, REQ_DOWN_ITEM)
            default: ()
            }
        }
    }
    
    public func selection() -> String {
        return String(cString: item_name(current_item(menuP)))
    }
    
    public func toggleCurrentItem() {
        menu_driver(menuP, REQ_TOGGLE_ITEM)
    }
}
