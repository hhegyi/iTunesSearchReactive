//
//  iTunesSearchResultViewModel.swift
//  iTunesSearchReactive
//
//  Created by Hajnalka Hegyi on 2016. 11. 07..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

import ReactiveCocoa

class iTunesSearchResultViewModel: iTunesAbstractResultViewModel {
    
    override func filterResults(searchText : String) {
        var filteredResults = Set<iTunesJsonData>()
        for object in resultModel.jsonDataObject {
            if (object.trackName.lowercaseString .containsString(searchText.lowercaseString)) {
                filteredResults.insert(object)
            }
        }
        
        if ((filteredResults.count < resultModel.jsonDataObject.count) && (!filterKeyword.isEmpty)) {
            listToShow = Array(filteredResults)
        } else {
            listToShow = Array(resultModel.jsonDataObject)
        }
    }
    
    override func cellTitle(index: Int) -> String {
        return listToShow[index].trackName
    }
    
    override func cellSubtitle(index: Int) -> String {
        return listToShow[index].artistName
    }
}
