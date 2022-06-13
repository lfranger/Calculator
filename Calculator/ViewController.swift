//
//  ViewController.swift
//  Calculator
//
//  Created by Consultant on 5/19/22.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operation {
        case add
        case substract
        case multiply
        case divide
        case none
    }
    
    var operation: Operation
    var isDouble: Bool = false
    
    var firstValue: Int = 0
    var firstValueDouble: Double = 0.0
    var secondValue: Int = 0
    var secondValueDouble: Double = 0.0
    
    public var calculate: String {
        didSet {
            calculateValue.text = self.calculate
        }
    }
    
    init(){
        self.calculate = ""
        self.operation = Operation.none
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var display: UIView = {
        let display = UIView()
        display.translatesAutoresizingMaskIntoConstraints = false
        display.backgroundColor = .black
        return display
    }()
    
    lazy var calculateValue: UILabel = {
        let calculateValue = UILabel()
        calculateValue.translatesAutoresizingMaskIntoConstraints = false
        calculateValue.textColor = .white
        calculateValue.textAlignment = .center
        calculateValue.font = UIFont.boldSystemFont(ofSize: 30.0)
        return calculateValue
    }()
    
    @ButtonStyle(text: "7", color: .systemGray)
    var sevenButton: UIButton
    
    @ButtonStyle(text: "8", color: .systemGray)
    var eightButton: UIButton
    
    @ButtonStyle(text: "9", color: .systemGray)
    var nineButton: UIButton
    
    @ButtonStyle(text: "+", color: .systemOrange)
    var plusButton: UIButton
    
    @HorizontalStack
    var horizontalStackTop: UIStackView
    
    @ButtonStyle(text: "4", color: .systemGray)
    var fourButton: UIButton
    
    @ButtonStyle(text: "5", color: .systemGray)
    var fiveButton: UIButton
    
    @ButtonStyle(text: "6", color: .systemGray)
    var sixButton: UIButton
    
    @ButtonStyle(text: "-", color: .systemOrange)
    var minusButton: UIButton
    
    @HorizontalStack
    var horizontalStackMiddle1: UIStackView
    
    @ButtonStyle(text: "1", color: .systemGray)
    var oneButton: UIButton
    
    @ButtonStyle(text: "2", color: .systemGray)
    var twoButton: UIButton
    
    @ButtonStyle(text: "3", color: .systemGray)
    var threeButton: UIButton
    
    @ButtonStyle(text: "x", color: .systemOrange)
    var multiplierButton: UIButton
    
    @HorizontalStack
    var horizontalStackMiddle2: UIStackView
    
    @ButtonStyle(text: "0", color: .systemGray)
    var zeroButton: UIButton
    
    @ButtonStyle(text: "AC", color: .systemGray)
    var ACButton: UIButton
    
    @ButtonStyle(text: ".", color: .systemGray)
    var dotButton: UIButton
    
    @ButtonStyle(text: "/", color: .systemOrange)
    var divisionButton: UIButton
    
//    @HorizontalStack
//    var twoButtonBottom: UIStackView
    
    @HorizontalStack
    var horizontalStackBottom: UIStackView
    
    @ButtonStyle(text: "=", color: .systemOrange)
    var equalButton: UIButton
    
    lazy var viewStack: UIStackView = {
        let viewStack = UIStackView()
        viewStack.translatesAutoresizingMaskIntoConstraints = false
        viewStack.axis = NSLayoutConstraint.Axis.vertical
        viewStack.distribution = UIStackView.Distribution.fill //.fillEqually
        viewStack.alignment = UIStackView.Alignment.fill
        viewStack.spacing = 5.0
        viewStack.backgroundColor = .black
        return viewStack
    }()
    
    func setupHorizontalStack(stack: UIStackView, buttons: [Any]) -> UIStackView {
        for button in buttons {
            stack.addArrangedSubview(button as! UIView)
        }
        return stack
    }

    func setupDisplayView() {
        calculateValue.text = calculate
        display.addSubview(calculateValue)
    }
    
    func setupDisplayConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(calculateValue.trailingAnchor.constraint(equalTo: display.trailingAnchor))
        constraints.append(calculateValue.bottomAnchor.constraint(equalTo: display.bottomAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(viewStack)
        
        zeroButton.addTarget(self, action: #selector(showNumber(_:)), for: .touchUpInside)
        oneButton.addTarget(self, action: #selector(showNumber(_:)), for: .touchUpInside)
        twoButton.addTarget(self, action: #selector(showNumber(_:)), for: .touchUpInside)
        threeButton.addTarget(self, action: #selector(showNumber(_:)), for: .touchUpInside)
        fourButton.addTarget(self, action: #selector(showNumber(_:)), for: .touchUpInside)
        fiveButton.addTarget(self, action: #selector(showNumber(_:)), for: .touchUpInside)
        sixButton.addTarget(self, action: #selector(showNumber(_:)), for: .touchUpInside)
        sevenButton.addTarget(self, action: #selector(showNumber(_:)), for: .touchUpInside)
        eightButton.addTarget(self, action: #selector(showNumber(_:)), for: .touchUpInside)
        nineButton.addTarget(self, action: #selector(showNumber(_:)), for: .touchUpInside)
        dotButton.addTarget(self, action: #selector(showNumber(_:)), for: .touchUpInside)
        
        plusButton.addTarget(self, action: #selector(doOperation(_:)), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(doOperation(_:)), for: .touchUpInside)
        multiplierButton.addTarget(self, action: #selector(doOperation(_:)), for: .touchUpInside)
        divisionButton.addTarget(self, action: #selector(doOperation(_:)), for: .touchUpInside)
        
        dotButton.addTarget(self, action: #selector(setIsDouble(_:)), for: .touchUpInside)
        
        equalButton.addTarget(self, action: #selector(getEqualValue(_:)), for: .touchUpInside)
        
        ACButton.addTarget(self, action: #selector(resetValue(_:)), for: .touchUpInside)
        
        let firstButtomRow = [
            sevenButton,
            eightButton,
            nineButton,
            plusButton
        ]
        
        let secondButtomRow = [
            fourButton,
            fiveButton,
            sixButton,
            minusButton
        ]
        
        let thirdButtonRow = [
            oneButton,
            twoButton,
            threeButton,
            multiplierButton
        ]
        
        let fourthButtonRow = [
//            zeroButton,
//            setupHorizontalStack(stack: twoButtonBottom, buttons: [dotButton, divisionButton])
            zeroButton,
            ACButton,
            dotButton,
            divisionButton
        ]

        setupDisplayView()
        setupDisplayConstraints()
        // Do any additional setup after loading the view.
        viewStack.addArrangedSubview(display)
        viewStack.addArrangedSubview(setupHorizontalStack(stack: horizontalStackTop, buttons: firstButtomRow))
        viewStack.addArrangedSubview(setupHorizontalStack(stack: horizontalStackMiddle1, buttons: secondButtomRow))
        viewStack.addArrangedSubview(setupHorizontalStack(stack: horizontalStackMiddle2, buttons: thirdButtonRow))
        viewStack.addArrangedSubview(setupHorizontalStack(stack: horizontalStackBottom, buttons: fourthButtonRow))
        viewStack.addArrangedSubview(equalButton)
        viewStackConstraints()
    }
    
    func viewStackConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(viewStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(viewStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(viewStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(viewStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        calculateValue.text = "0"
    }
    
    @objc
    func showNumber(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
            self.calculate += buttonTitle
          }
    }
    
    @objc
    func setIsDouble(_ sender: UIButton) {
        self.isDouble = true
    }
    
    @objc
    func resetValue(_ sender: UIButton) {
        self.isDouble = false
        self.firstValue = 0
        self.firstValueDouble = 0.0
        self.secondValue = 0
        self.secondValueDouble = 0.0
        
        self.calculate = ""
        calculateValue.text = String(0)
    }
    
    @objc
    func doOperation(_ sender: UIButton) {
        
        if isDouble{
            
            self.firstValueDouble = Double(self.calculate)!
            print("First value double: \(firstValueDouble)")
            
        } else {
            
            self.firstValue = Int(self.calculate)!
            print("First value: \(firstValue)")
            
        }
        
        
        let buttonSign = sender.title(for: .normal)
        
        switch buttonSign {
            case "+":
                print("+")
                operation = Operation.add
                //secondValue = true
                //self.calculate = ""
                //calculateValue.text = String(firstValue)
                //calculateValue.text = (isDouble) ? String(self.firstValueDouble) : String(self.firstValue)
            break
            
            case "-":
                print("-")
                operation = Operation.substract
                //secondValue = true
                //self.calculate = ""
                //calculateValue.text = String(firstValue)
            break
                
            case "x":
                print("x")
                operation = Operation.multiply
                //secondValue = true
                //self.calculate = ""
                //calculateValue.text = String(firstValue)
            break
                
            case "/":
                print("/")
                operation = Operation.divide
                //isDouble = true
                //secondValue = true
                //self.calculate = ""
                //calculateValue.text = String(firstValue)
            break
            
            default:
                operation = Operation.none
                break
        }
        
        self.calculate = ""
        calculateValue.text = (isDouble) ? String(self.firstValueDouble) : String(self.firstValue)
        
    }
    
    @objc
    func getEqualValue(_ sender: UIButton) {
        
        var result: Int = 0
        var resultDouble: Double = 0
        
        if isDouble {
            
            self.secondValueDouble = Double(self.calculate)!
            print("Second value double: \(secondValueDouble)")
            
            switch operation {
            case .add:
                resultDouble = firstValueDouble + secondValueDouble
            case .substract:
                resultDouble = firstValueDouble - secondValueDouble
            case .multiply:
                resultDouble = firstValueDouble * secondValueDouble
            case .divide:
                //resultDouble = firstValueDouble / secondValueDouble
                break
            case .none:
                break
            }
            
            self.calculate = String(resultDouble)
            self.calculate = ""
            calculateValue.text = String(resultDouble)
            
        } else {
            
            self.secondValue = Int(self.calculate)!
            print("Second value: \(secondValue)")
            
            switch operation {
            case .add:
                result = firstValue + secondValue
            case .substract:
                result = firstValue - secondValue
            case .multiply:
                result = firstValue * secondValue
            case .divide:
                //result = firstValue / secondValue
                break
            case .none:
                break
            }
            
            self.calculate = String(result)
            self.calculate = ""
            calculateValue.text = String(result)
            
        }
        
        if operation == .divide {
            resultDouble = (isDouble) ? firstValueDouble / secondValueDouble : Double(firstValue)/Double(secondValue)
            
            self.calculate = String(resultDouble)
            self.calculate = ""
            calculateValue.text = String(resultDouble)
        }
        
    }

}


