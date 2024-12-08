
import UIKit

class ExercisesTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelSetsAndReps: UILabel!
    var labelRest: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelName()
        setupLabelSetsAndReps()
        setupLabelRest()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 20)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupLabelSetsAndReps(){
        labelSetsAndReps = UILabel()
        labelSetsAndReps.font = UIFont.boldSystemFont(ofSize: 10)
        labelSetsAndReps.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelSetsAndReps)
    }
    
    func setupLabelRest(){
        labelRest = UILabel()
        labelRest.font = UIFont.boldSystemFont(ofSize: 10)
        labelRest.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelRest)
    }
    
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 5),
            labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelName.heightAnchor.constraint(equalToConstant: 20),
            labelName.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelSetsAndReps.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 5),
            labelSetsAndReps.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelSetsAndReps.heightAnchor.constraint(equalToConstant: 10),
            labelSetsAndReps.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelRest.topAnchor.constraint(equalTo: labelSetsAndReps.bottomAnchor, constant: 5),
            labelRest.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelRest.heightAnchor.constraint(equalToConstant: 10),
            labelRest.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
