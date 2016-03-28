class SignatureSection extends React.Component {
    constructor(props){
        super(props);
    }

    clearSign(e){
        e.preventDefault();
        $('#sign').jSignature("clear")
    }


    componentDidMount(){
        $("#sign").jSignature();
        props = this.props;
        if(props.values){
            if(props.values.signature){
                $('#sign').jSignature("setData", "data:" + props.values.signature.join(","))
            }
        }
    }

    calculatePercentage(){
        var count = 0;
        if($('#sign').jSignature('getData', 'base30')[1])
            count += 1;
        return count;
        console.log(count);
    }

    getSignData(e){
        e.preventDefault();
        this.sign = $('#sign').jSignature("getData", "base30");
        alert(this.sign);
        var data = {};
        data.type = 'Signature';
        data.signature = $('#sign').jSignature("getData", "base30");
        this.props.updateData(data);
        this.props.updatePercentage(data.type, this.calculatePercentage())
    }


    render(){
        return(
            <div>
                <h3>Here you must leave your signature</h3>
                <h4>
                    <small>
                        We need your digital signature. Leave your sign and click 'Save'
                    </small>
                </h4>
                <div id="sign"/>
                <button className="btn btn-default" onClick={ this.clearSign.bind(this) }>
                    Clear
                </button>
                <button className="btn btn-primary" onClick={ this.getSignData.bind(this) }>
                    Save
                </button>
            </div>
        );
    }
}