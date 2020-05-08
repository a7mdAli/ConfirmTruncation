import UIKit

func willTruncate(text: String, font: UIFont, lineSpacing: CGFloat, maxNumberOfLines: Int, availableWidth: CGFloat) -> Bool {
    let paragraph = NSMutableParagraphStyle()
    paragraph.lineSpacing = lineSpacing
    let sizeThatFits = text.boundingRect(with: CGSize(width: availableWidth, height: .greatestFiniteMagnitude),
                                         options: .usesLineFragmentOrigin,
                                         attributes: [.font: font, .paragraphStyle: paragraph],
                                         context: nil)
    
    let height = sizeThatFits.height
    let numberOfLines = Int(round(height / (font.lineHeight + lineSpacing)))
    return numberOfLines > maxNumberOfLines
}

let str = "Hello, world!"
willTruncate(text: str, font: .systemFont(ofSize: 12), lineSpacing: 5, maxNumberOfLines: 1, availableWidth: 100) // false
willTruncate(text: str+str, font: .systemFont(ofSize: 12), lineSpacing: 5, maxNumberOfLines: 1, availableWidth: 100) // true
