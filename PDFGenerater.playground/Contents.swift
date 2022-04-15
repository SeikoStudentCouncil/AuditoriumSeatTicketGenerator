import UIKit
import PDFKit

final class SamplePage: PDFPage {
    private let width = 620
    private let height = 290
    private let seat: String
    private let block: String

    init(seat: String) {
        self.seat = seat
        let split = seat.split(separator: "-")
        let row = String(split[0])
        let line = Int(split[1])!
        var tmp = Int()
        if row >= "K"{
            tmp = 3
        }
        switch line{
        case ...16:
            tmp += 1
        case 17...32:
            tmp += 2
        default:
            tmp += 3
        }
        self.block = "\(tmp)"
        super.init()
    }

    override func draw(with box: PDFDisplayBox, to context: CGContext) {
        super.draw(with: box, to: context)
        UIGraphicsPushContext(context)
        context.translateBy(x: 0.0, y: CGFloat(height))
        context.scaleBy(x: 1.0, y: -1.0)
        let alignment =  NSMutableParagraphStyle()
        alignment.alignment = .center
        "＜グランドフィナーレ入場券＞".draw(in: CGRect(x: 0, y: 10, width: width, height: height), withAttributes: [NSAttributedString.Key.font: UIFont(name: "Hiragino Sans W6", size: 35) as Any, NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.paragraphStyle: alignment])
        "入場時刻 15:00〜15:25\n受付場所 講堂正面玄関".draw(in: CGRect(x: 10, y: 60, width: width, height: height), withAttributes: [NSAttributedString.Key.font: UIFont(name: "Hiragino Sans", size: 30) as Any, NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.baselineOffset: 10])
        "座席 \(seat)".draw(in: CGRect(x: 10, y: 140, width: width, height: height), withAttributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,NSAttributedString.Key.font: UIFont(name: "Hiragino Sans", size: 70) as Any, NSAttributedString.Key.foregroundColor: UIColor.black])
        "※キャンセルの際は入場ゲート前\n　企画部門員（オレンジT）まで".draw(in: CGRect(x: 10, y: 225, width: width, height: height), withAttributes: [NSAttributedString.Key.font: UIFont(name: "Hiragino Sans", size: 25) as Any, NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.baselineOffset: 10])
        "ステージ側".draw(in: CGRect(x: 450, y: 80, width: width, height: height), withAttributes: [NSAttributedString.Key.font: UIFont(name: "Hiragino Sans", size: 25) as Any, NSAttributedString.Key.foregroundColor: UIColor.black])
        UIImage(named: "\(block).png")!.draw(in: CGRect(x: 410, y: 110, width: 200, height: 120))
        "（座席参照図）".draw(in: CGRect(x: 200, y: 240, width: width, height: height), withAttributes: [NSAttributedString.Key.font: UIFont(name: "Hiragino Sans", size: 20) as Any, NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.paragraphStyle: alignment])
        UIGraphicsPopContext()
    }

    override func bounds(for box: PDFDisplayBox) -> CGRect {
        return CGRect(x: 0, y: 0, width: width, height: height)
    }
    
}

let pdf = PDFDocument()
let seats = ["A-11", "A-12", "A-13", "A-14", "A-15", "A-16", "A-17", "A-18", "A-19", "A-20", "A-21", "A-22", "A-23", "A-24", "A-25", "A-26", "A-27", "A-28", "A-29", "A-30", "A-31", "A-32", "A-33", "A-34", "A-35", "A-36", "A-37", "A-38", "B-08", "B-09", "B-10", "B-11", "B-12", "B-13", "B-14", "B-15", "B-16", "B-17", "B-18", "B-19", "B-20", "B-21", "B-22", "B-23", "B-24", "B-25", "B-26", "B-27", "B-28", "B-29", "B-30", "B-31", "B-32", "B-33", "B-34", "B-35", "B-36", "B-37", "B-38", "B-39", "B-40", "B-41", "C-07", "C-08", "C-09", "C-10", "C-11", "C-12", "C-13", "C-14", "C-15", "C-16", "C-17", "C-18", "C-19", "C-20", "C-21", "C-22", "C-23", "C-24", "C-25", "C-26", "C-27", "C-28", "C-29", "C-30", "C-31", "C-32", "C-33", "C-34", "C-35", "C-36", "C-37", "C-38", "C-39", "C-40", "C-41", "C-42", "D-06", "D-07", "D-08", "D-09", "D-10", "D-11", "D-12", "D-13", "D-14", "D-15", "D-16", "D-17", "D-18", "D-19", "D-20", "D-21", "D-22", "D-23", "D-24", "D-25", "D-26", "D-27", "D-28", "D-29", "D-30", "D-31", "D-32", "D-33", "D-34", "D-35", "D-36", "D-37", "D-38", "D-39", "D-40", "D-41", "D-42", "D-43", "E-05", "E-06", "E-07", "E-08", "E-09", "E-10", "E-11", "E-12", "E-13", "E-14", "E-15", "E-16", "E-17", "E-18", "E-19", "E-20", "E-21", "E-22", "E-23", "E-24", "E-25", "E-26", "E-27", "E-28", "E-29", "E-30", "E-31", "E-32", "E-33", "E-34", "E-35", "E-36", "E-37", "E-38", "E-39", "E-40", "E-41", "E-42", "E-43", "E-44", "F-05", "F-06", "F-07", "F-08", "F-09", "F-10", "F-11", "F-12", "F-13", "F-14", "F-15", "F-16", "F-17", "F-18", "F-19", "F-20", "F-21", "F-22", "F-23", "F-24", "F-25", "F-26", "F-27", "F-28", "F-29", "F-30", "F-31", "F-32", "F-33", "F-34", "F-35", "F-36", "F-37", "F-38", "F-39", "F-40", "F-41", "F-42", "F-43", "F-44", "G-04", "G-05", "G-06", "G-07", "G-08", "G-09", "G-10", "G-11", "G-12", "G-13", "G-14", "G-15", "G-16", "G-17", "G-18", "G-19", "G-20", "G-21", "G-22", "G-23", "G-24", "G-25", "G-26", "G-27", "G-28", "G-29", "G-30", "G-31", "G-32", "G-33", "G-34", "G-35", "G-36", "G-37", "G-38", "G-39", "G-40", "G-41", "G-42", "G-43", "G-44", "H-03", "H-04", "H-05", "H-06", "H-07", "H-08", "H-09", "H-10", "H-11", "H-12", "H-13", "H-14", "H-15", "H-16", "H-17", "H-18", "H-19", "H-20", "H-21", "H-22", "H-23", "H-24", "H-25", "H-26", "H-27", "H-28", "H-29", "H-30", "H-31", "H-32", "H-33", "H-34", "H-35", "H-36", "H-37", "H-38", "H-39", "H-40", "H-41", "H-42", "H-43", "H-44", "H-45", "H-46", "I-02", "I-03", "I-04", "I-05", "I-06", "I-07", "I-08", "I-09", "I-10", "I-11", "I-12", "I-13", "I-14", "I-15", "I-16", "I-17", "I-18", "I-19", "I-20", "I-21", "I-22", "I-23", "I-24", "I-25", "I-26", "I-27", "I-28", "I-29", "I-30", "I-31", "I-32", "I-33", "I-34", "I-35", "I-36", "I-37", "I-38", "I-39", "I-40", "I-41", "I-42", "I-43", "I-44", "I-45", "I-46", "I-47", "J-02", "J-03", "J-04", "J-05", "J-06", "J-07", "J-08", "J-09", "J-10", "J-11", "J-12", "J-13", "J-14", "J-15", "J-16", "J-17", "J-18", "J-19", "J-20", "J-21", "J-22", "J-23", "J-24", "J-25", "J-26", "J-27", "J-28", "J-29", "J-30", "J-31", "J-32", "J-33", "J-34", "J-35", "J-36", "J-37", "J-38", "J-39", "J-40", "J-41", "J-42", "J-43", "J-44", "J-45", "J-46", "J-47", "K-01", "K-02", "K-03", "K-04", "K-05", "K-06", "K-07", "K-08", "K-09", "K-10", "K-11", "K-12", "K-13", "K-14", "K-15", "K-16", "K-17", "K-18", "K-19", "K-20", "K-21", "K-22", "K-23", "K-24", "K-25", "K-26", "K-27", "K-28", "K-29", "K-30", "K-31", "K-32", "K-33", "K-34", "K-35", "K-36", "K-37", "K-38", "K-39", "K-40", "K-41", "K-42", "K-43", "K-44", "K-45", "K-46", "K-47", "K-48", "L-06", "L-07", "L-08", "L-09", "L-10", "L-11", "L-12", "L-13", "L-14", "L-15", "L-16", "L-17", "L-18", "L-19", "L-20", "L-21", "L-22", "L-23", "L-24", "L-25", "L-26", "L-27", "L-28", "L-29", "L-30", "L-31", "L-32", "L-33", "L-34", "L-35", "L-36", "L-37", "L-38", "L-39", "L-40", "L-41", "L-42", "L-43", "L-44", "L-45", "L-46", "L-47", "L-48", "M-02", "M-03", "M-04", "M-05", "M-06", "M-07", "M-08", "M-09", "M-10", "M-11", "M-12", "M-13", "M-14", "M-15", "M-16", "M-17", "M-18", "M-19", "M-20", "M-21", "M-22", "M-23", "M-24", "M-25", "M-26", "M-27", "M-28", "M-29", "M-30", "M-31", "M-32", "M-33", "M-34", "M-35", "M-36", "M-37", "M-38", "M-39", "M-40", "M-41", "M-42", "M-43", "M-44", "M-45", "M-46", "M-47", "M-48", "N-01", "N-02", "N-03", "N-04", "N-05", "N-06", "N-07", "N-08", "N-09", "N-10", "N-11", "N-12", "N-13", "N-14", "N-15", "N-16", "N-17", "N-18", "N-19", "N-20", "N-21", "N-22", "N-23", "N-24", "N-25", "N-26", "N-27", "N-28", "N-29", "N-30", "N-31", "N-32", "N-33", "N-34", "N-35", "N-36", "N-37", "N-38", "N-39", "N-40", "N-41", "N-42", "N-43", "N-44", "N-45", "N-46", "N-47", "N-48", "O-01", "O-02", "O-03", "O-04", "O-05", "O-06", "O-07", "O-08", "O-09", "O-10", "O-11", "O-12", "O-13", "O-14", "O-15", "O-16", "O-17", "O-18", "O-19", "O-20", "O-21", "O-22", "O-23", "O-24", "O-25", "O-26", "O-27", "O-28", "O-29", "O-30", "O-31", "O-32", "O-33", "O-34", "O-35", "O-36", "O-37", "O-38", "O-39", "O-40", "O-41", "O-42", "O-43", "O-44", "O-45", "O-46", "O-47", "O-48", "P-01", "P-02", "P-03", "P-04", "P-05", "P-06", "P-07", "P-08", "P-09", "P-10", "P-11", "P-12", "P-13", "P-14", "P-15", "P-16", "P-17", "P-18", "P-19", "P-20", "P-21", "P-22", "P-23", "P-24", "P-25", "P-26", "P-27", "P-28", "P-29", "P-30", "P-31", "P-32", "P-33", "P-34", "P-35", "P-36", "P-37", "P-38", "P-39", "P-40", "P-41", "P-42", "P-43", "P-44", "P-45", "P-46", "P-47", "P-48", "Q-01", "Q-02", "Q-03", "Q-04", "Q-05", "Q-06", "Q-07", "Q-08", "Q-09", "Q-10", "Q-11", "Q-12", "Q-13", "Q-14", "Q-15", "Q-16", "Q-17", "Q-18", "Q-19", "Q-20", "Q-21", "Q-22", "Q-23", "Q-24", "Q-25", "Q-26", "Q-27", "Q-28", "Q-29", "Q-30", "Q-31", "Q-32", "Q-33", "Q-34", "Q-35", "Q-36", "Q-37", "Q-38", "Q-39", "Q-40", "Q-41", "Q-42", "Q-43", "Q-44", "Q-45", "Q-46", "Q-47", "Q-48", "R-01", "R-02", "R-03", "R-04", "R-05", "R-06", "R-07", "R-08", "R-09", "R-10", "R-11", "R-12", "R-13", "R-14", "R-15", "R-16", "R-17", "R-18", "R-19", "R-20", "R-21", "R-22", "R-23", "R-24", "R-25", "R-26", "R-27", "R-28", "R-29", "R-30", "R-31", "R-32", "R-33", "R-34", "R-35", "R-36", "R-37", "R-38", "R-39", "R-40", "R-41", "R-42", "R-43", "R-44", "R-45", "R-46", "R-47", "R-48", "S-01", "S-02", "S-03", "S-04", "S-05", "S-06", "S-07", "S-08", "S-09", "S-10", "S-11", "S-12", "S-13", "S-14", "S-15", "S-16", "S-17", "S-18", "S-19", "S-20", "S-21", "S-22", "S-23", "S-24", "S-25", "S-26", "S-27", "S-28", "S-29", "S-30", "S-31", "S-32", "S-33", "S-34", "S-35", "S-36", "S-37", "S-38", "S-39", "S-40", "S-41", "S-42", "S-43", "S-44", "S-45", "S-46", "S-47", "S-48", "T-01", "T-02", "T-03", "T-04", "T-05", "T-06", "T-07", "T-08", "T-09", "T-10", "T-11", "T-12", "T-13", "T-14", "T-15", "T-16", "T-17", "T-18", "T-19", "T-20", "T-21", "T-22", "T-23", "T-24", "T-25", "T-26", "T-27", "T-28", "T-29", "T-30", "T-31", "T-32", "T-33", "T-34", "T-35", "T-36", "T-37", "T-38", "T-39", "T-40", "T-41", "T-42", "T-43", "T-44", "T-45", "T-46", "T-47", "T-48", "U-01", "U-02", "U-03", "U-04", "U-05", "U-06", "U-07", "U-08", "U-09", "U-10", "U-11", "U-12", "U-13", "U-14", "U-15", "U-16", "U-17", "U-18", "U-19", "U-20", "U-21", "U-22", "U-23", "U-24", "U-25", "U-26", "U-27", "U-28", "U-29", "U-30", "U-31", "U-32", "U-33", "U-34", "U-35", "U-36", "U-37", "U-38", "U-39", "U-40", "U-41", "U-42", "U-43", "U-44", "U-45", "U-46", "U-47", "U-48", "V-01", "V-02", "V-03", "V-04", "V-05", "V-06", "V-07", "V-08", "V-09", "V-10", "V-11", "V-12", "V-13", "V-14", "V-15", "V-16", "V-17", "V-18", "V-19", "V-20", "V-21", "V-22", "V-23", "V-24", "V-25", "V-26", "V-27", "V-28", "V-29", "V-30", "V-31", "V-32", "V-33", "V-34", "V-35", "V-36", "V-37", "V-38", "V-39", "V-40", "V-41", "V-42", "V-43", "V-44", "V-45", "V-46", "V-47", "V-48", "W-01", "W-02", "W-03", "W-04", "W-05", "W-06", "W-07", "W-08", "W-09", "W-10", "W-11", "W-12", "W-13", "W-14", "W-15", "W-16", "W-17", "W-18", "W-19", "W-20", "W-21", "W-22", "W-23", "W-24", "W-25", "W-26", "W-27", "W-28", "W-29", "W-30", "W-31", "W-32", "W-33", "W-34", "W-35", "W-36", "W-37", "W-38", "W-39", "W-40", "W-41", "W-42", "W-43", "W-44", "W-45", "W-46", "W-47", "W-48", "X-01", "X-02", "X-03", "X-04", "X-05", "X-06", "X-07", "X-08", "X-09", "X-10", "X-11", "X-12", "X-13", "X-14", "X-15", "X-16", "X-17", "X-18", "X-19", "X-20", "X-21", "X-22", "X-23", "X-24", "X-25", "X-26", "X-27", "X-28", "X-29", "X-30", "X-31", "X-32", "X-33", "X-34", "X-35", "X-36", "X-37", "X-38", "X-39", "X-40", "X-41", "X-42", "X-43", "X-44", "X-45", "X-46", "X-47", "X-48"]
for index in 0...seats.count-1 {
    pdf.insert(SamplePage(seat: seats[index]), at: index)
}

    if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let path = url.appendingPathComponent("output.pdf")
        print(path)
        pdf.write(to: path)
    }

