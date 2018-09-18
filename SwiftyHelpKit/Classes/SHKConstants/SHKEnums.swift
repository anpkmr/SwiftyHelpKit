
//  Created by SwiftyHelpKit  on 7/31/18.
//  Copyright © 2018 SwiftyHelpKit. All rights reserved.
//

import Foundation
import UIKit

/// Can be used instead of Bool and show the error message respectively
///
/// - Valid: if valid just handle the valid case
/// - Invalid: show an error message for invalidation
public enum SHKValidation {
    case Valid
    case Invalid(String)
}
