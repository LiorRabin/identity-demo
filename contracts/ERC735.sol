pragma solidity ^0.4.24;

// https://github.com/ethereum/EIPs/issues/735
contract ERC735 {

    event ClaimRequested(uint256 indexed claimRequestId, uint256 indexed claimType, uint256 scheme, address indexed issuer, bytes signature, bytes data, string uri);
    event ClaimAdded(bytes32 indexed claimId, uint256 indexed claimType, uint256 scheme, address indexed issuer, bytes signature, bytes data, string uri);
    event ClaimRemoved(bytes32 indexed claimId, uint256 indexed claimType, uint256 scheme, address indexed issuer, bytes signature, bytes data, string uri);
    event ClaimChanged(bytes32 indexed claimId, uint256 indexed claimType, uint256 scheme, address indexed issuer, bytes signature, bytes data, string uri);

    // Claim ID is defined for each claim, which is keccak256(issuer + claimType).
    // This means that with the same issuer and the same claimType, the Claim ID will always be the same for all entities.
    struct Claim {
        uint256 claimType;
        uint256 scheme;
        address issuer; // msg.sender
        bytes signature; // this.address + claimType + data
        bytes data;
        string uri;
    }

    function addClaim(uint256 _claimType, uint256 _scheme, address _issuer, bytes _signature, bytes _data, string _uri) public returns (bytes32 claimRequestId);
    function getClaim(bytes32 _claimId) public constant returns(uint256 claimType, uint256 scheme, address issuer, bytes signature, bytes data, string uri);
    function getClaimIdsByType(uint256 _claimType) public constant returns(bytes32[] claimIds);
    function removeClaim(bytes32 _claimId) public returns (bool success);
}
